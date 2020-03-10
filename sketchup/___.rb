# Copyright 2009, Ryan Schenk rschenk@gmail.com
# Glue Tabs
#
# 

# THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
#-----------------------------------------------------------------------------
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/___.rb"

require 'sketchup.rb'

class GlueTab
	def initialize
		@tab_width = 1.0
	end

    def activate
        begin
            @tab_width = Sketchup.read_default("GlueTab", "tab_width").to_l
        rescue
            puts "Couldn't convert value to Length"
            @tab_width = 1.0
        end
        Sketchup::set_status_text("Glue Tab: Select Edge", SB_PROMPT)
        Sketchup::set_status_text("Tab Width:", SB_VCB_LABEL)
        Sketchup::set_status_text(@tab_width, SB_VCB_VALUE)
    end

    def deactivate view
        Sketchup.write_default("GlueTab", 'tab_width', @tab_width.to_f)
    end

    def resume(view)
        Sketchup::set_status_text("Glue Tab: Select Edge", SB_PROMPT)
        Sketchup::set_status_text("Tab Width:", SB_VCB_LABEL)
        Sketchup::set_status_text(@tab_width, SB_VCB_VALUE)
    end
	
	def onLButtonDown(flags, x, y, view)
		model = Sketchup.active_model
		ph = model.active_view.pick_helper
		ph.do_pick x, y
		
    if edge = ph.picked_edge
      puts edge
			faces = edge.faces
			if faces.length == 1 # If we're on a boundary edge
				draw_tab(model, edge, faces.first)
			end
		end
	end

    def onUserText(text, view)
        begin
            val = text.to_l
        rescue Exception => e
            puts e, e.backtrace
        else
            @tab_width=val
        end
    end

    def draw_tab(model, edge, face)
        
        normal_vector = face.normal
        line = edge.line

        # Calculate a magic unit vector perpendicular to the edge
        v = normal_vector * line[1]

        tab_points = calculate_tab_points(edge.start.position, edge.end.position, v, line[1])

        # Sometimes the magic unit vector will get reversed, and the tab will be positioned on the face.
        # If that's the case, reverse the magic vector to make the tab is point away from the face.
        # I hate having to recalculate the whole thing, but it's the best solution I could come up with.
        unless (face.classify_point(tab_points[2]) == 8) && (face.classify_point(tab_points[3]) == 8)
            tab_points = calculate_tab_points(edge.start.position, edge.end.position, v.reverse, line[1])
        end

        model.entities.add_face tab_points
    end

    def calculate_tab_points(edge_start_position, edge_end_position, magic_unit_vector, line_vector)
        # The magic unit vector is perpendicular to the edge and the normal vector of the face

        tab_width_vector = magic_unit_vector.clone
        tab_width_vector.length = @tab_width

        trapezoid_end_vector = line_vector.clone
        trapezoid_end_vector.length = @tab_width
        
        edge_length = edge_start_position.distance(edge_end_position)

        # If the edge is too short to handle a trapezoidal tab at the @tab_width,
        # we'll make a triangular one that's as wide as possible
        if trapezoid_end_vector.length >=  edge_length / 2
          making_triangular_tab = true
          tab_width_vector.length = trapezoid_end_vector.length = edge_length / 2
        end

        points = [edge_start_position,
                  edge_end_position,
                  edge_end_position   + tab_width_vector - trapezoid_end_vector]
                    
        points << edge_start_position + tab_width_vector + trapezoid_end_vector unless making_triangular_tab
        
        return points
    end
end

unless file_loaded?(__FILE__)
    menu_name = "Glue Tab"
    UI.menu("Window").add_item(menu_name) { Sketchup.active_model.select_tool(GlueTab.new) } 
end
file_loaded(__FILE__)
