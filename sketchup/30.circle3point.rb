# 30.circle3point.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/30.circle3point.rb"
require 'sketchup.rb'
require 'extensions.rb'


class Circle3Point

  # Phương thức vẽ đường tròn từ ba điểm (khác nhau, không thẳng hàng)
  # @param [Geom::Point3d] a
  # @param [Geom::Point3d] b
  # @param [Geom::Point3d] c
  def circle_3point(a, b, c)
    ents = Sketchup.active_model.entities

    ents.add_cpoint

    lineab = [a,b]
    linebc = [b,c]
  
    projecta_bc = a.project_to_line linebc
    projectc_ab = c.project_to_line lineab
    normal_bc = (projecta_bc.vector_to a).normalize
    normal_ab = (projectc_ab.vector_to c).normalize
  
    mab = Geom::Point3d.linear_combination 0.5, a, 0.5, b
    mbc = Geom::Point3d.linear_combination 0.5, b, 0.5, c
    ab_center = [mab, normal_ab]
    bc_center = [mbc, normal_bc]
    center = Geom.intersect_line_line ab_center, bc_center
    radius = center.distance a 
    normal = (a.vector_to b) * (b.vector_to c).normalize
    ents.add_circle center, normal, radius, 900
  end

  # Gọi khi kích hoạt công cụ  
  def activate
    puts 'Kích hoạt Tool'
    # InputPoint để nhấn chuột chọn các Entity
    @input  = Sketchup::InputPoint.new
    @point1 = nil
    @point2 = nil
    @point3 = nil
    @pointmove = nil
    # Hiện thông báo VCB
    Sketchup.set_status_text "Nhập điểm 1", SB_VCB_LABEL
  end
  # Gọi khi hủy chọn công cụ
  def deactivate(view)
    puts "Bất hoạt tool: #{view}"
  end

  def onCancel(reason, view)
    puts "Hủy chọn tool ##{reason} trong view: #{view}"
  end
  
  # @param [Sketchup::View] view
  def draw(view) 
    options = {
      :font => "Arial",
      :size => 20,
      :bold => true,
      :align => TextAlignRight
    }
    point = Geom::Point3d.new(200, 200, 0)
    view.draw_text(point, "Vẽ hình tròn có 3 điểm", options)

    view.drawing_color = Sketchup::Color.new(255, 0, 0, 64)
    if !@pointmove.nil?
        # Vẽ điểm tại chuột
        status = view.draw_points @pointmove, 10, 2, "red"
    end
    view.draw_points(@point1,10,2, "red") if !@point1.nil?
    view.draw_points(@point2,10,2, "red") if !@point2.nil?
    view.draw_points(@point3,10,2, "red") if !@point3.nil?    
  end
    
  # Bắt sự kiện di chuyển chuột
    def onMouseMove(flags, x, y, view)
        # Hiện thị tọa độ trong VCB
        @input.pick view, x, y 
        @pointmove = @input.position 
        # Hiện thị tooltip điểm
        view.tooltip = @input.tooltip
        view.invalidate
    end
   
    # Bắt sự kiện nhấn chuột trái
    def onLButtonDown flags, x, y, view
        @input.pick view, x, y
        
        if @point1.nil?
          @point1 = @input.position
          Sketchup.set_status_text "Nhập điểm 2", SB_VCB_LABEL
        elsif @point2.nil?
          tempoint = @input.position
          if !(tempoint == @point1)
            @point2 = tempoint
            Sketchup.set_status_text "Nhập điểm 3", SB_VCB_LABEL
          else
            puts "Hai điểm trùng nhau"  
          end
        elsif @point3.nil?
          tempoint = @input.position
          if !((tempoint == @point1) || (tempoint == @point2))
            @point3 = tempoint if !tempoint.on_line? [@point1, @point2] 
            if (@point3.nil?)
              UI.messagebox("Ba điểm không được thẳng hàng")
            else
              circle_3point(@point1, @point2, @point3)
              Sketchup.active_model.select_tool nil
            end
          else
            puts "Hai điểm trùng nhau"  
          end
        end 
    end

end

if( not file_loaded? "30.circle3point.rb" )
    # Tạo menu chọn công cụ
    simple_cmd = UI::Command.new("Circle 3 Point") {
        # Chọn công cụ
        Sketchup.active_model.select_tool Circle3Point.new 
    }
    tool_menu = UI.menu "Tools" 
    tool_menu.add_separator 
    tool_menu.add_item simple_cmd
    file_loaded "30.circle3point.rb"
end