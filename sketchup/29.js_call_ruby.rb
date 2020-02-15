# 29.js_call_ruby.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/29.js_call_ruby.rb"
require 'sketchup.rb'
require 'extensions.rb'

 if defined? $dialoginfo
    $dialoginfo.close
 end
$dialoginfo = UI::HtmlDialog.new(
  {
    :dialog_title => "Ví dụ HTML Dialog", 
    :preferences_key => "xuanthulab.net",   
    :scrollable => true,                   
    :resizable => true,               
    :width => 300,                 
    :height => 400,
    :left => 100,                
    :top => 100,
    :min_width => 50,
    :min_height => 50,
    :max_width =>500,                       
    :max_height => 400,
    :style => UI::HtmlDialog::STYLE_DIALOG  
  })

  
  $dialoginfo.set_file(__dir__ + '/29.js_call_ruby.html')

  

  
  $dialoginfo.add_action_callback("create_face") {|action_context, points| 
    # @type [Array] points
    # points.each {
    #    |e|
    #    # @type [Hash] e   
    #  }
 
    
    pt1 = Geom::Point3d.new(Float(points[0]['x'].strip).mm, Float(points[0]['y'].strip).mm, Float(points[0]['z'].strip).mm)
    pt2 = Geom::Point3d.new(Float(points[1]['x'].strip).mm, Float(points[1]['y'].strip).mm, Float(points[1]['z'].strip).mm)
    pt3 = Geom::Point3d.new(Float(points[2]['x'].strip).mm, Float(points[2]['y'].strip).mm, Float(points[2]['z'].strip).mm)
    pt4 = Geom::Point3d.new(Float(points[3]['x'].strip).mm, Float(points[3]['y'].strip).mm, Float(points[3]['z'].strip).mm)

    vec1 = pt2 - pt1
    vec2 = pt2 - pt3
    plane = [pt1, vec1 * vec2]
    
    if pt4.on_plane? plane
      Sketchup.active_model.entities.add_face pt1, pt2, pt3, pt4 
    else 
      puts "Invalid input. Points must lie on the same plane."
    end

  }


  $dialoginfo.show
  