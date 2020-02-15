# 28.ruby-call-js.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/28.ruby-call-js.rb"
require 'sketchup.rb'
require 'extensions.rb'




class SelObserver < Sketchup::SelectionObserver
  @entityselect = nil 
  # @param [Sketchup::Entity] e
  def showinfomation(e)
    @entityselect = e
    puts e.class.to_s
    s = ''
    # @type [Sketchup::ArcCurve]
    curve = nil
    curve = e.curve if e.class.to_s == 'Sketchup::Edge'
    if curve
      #  curve.edges.each {|x| puts x}
      puts curve.class 
      if curve.class.to_s == 'Sketchup::ArcCurve'
         if  (curve.end_angle - curve.start_angle).abs  == 2 * Math::PI
            s += "<h1>Hinh tròn</h1>"
         else
            s += "<h1>Cung tròn</h1>" 
         end 
      end
      s += "<h2>Phân đoạn: #{curve.edges.length}</h2>"
      s += "<h2>Chiều dài: #{curve.length.to_mm}</h2>"
    else
      # Face
      if e.class.to_s == 'Sketchup::Face'
        # @type [Sketchup::Face]
        face = e
        s += "<h1>Mặt - Face</h1>" 
        s += "<h2>Pháp tuyến: #{face.normal.to_s}</h2>"
        s += "<h2>Diện tích: #{face.area.to_mm.to_mm}</h2>"
        s += "<h2>Phân đoạn: #{face.edges.length}</h2>"
      end
      
    end 
    s = 'Chọn cung tròn hoặc mặt!' if s == ''
    
    # Đưa vào Hộp thoại
    $dialoginfo.execute_script("setBodyContent('#{s}')")
  end  

  def onSelectionBulkChange(selection)
      first_ent = selection[0]
      if ! (first_ent.equal? @entityselect)
        showinfomation first_ent
      end 
      
  end
end

sel = Sketchup.active_model.selection 
if defined?($selob)
  puts "Remove Observer"
  sel.remove_observer $selob
end
$selob = SelObserver.new
sel.add_observer $selob

$dialoginfo = UI::HtmlDialog.new(
  {
    :dialog_title => "Ví dụ HTML Dialog", 
    :preferences_key => "xuanthulab.net",   
    :scrollable => true,                   
    :resizable => true,               
    :width => 300,                 
    :height => 200,
    :left => 100,                
    :top => 100,
    :min_width => 50,
    :min_height => 50,
    :max_width =>500,                       
    :max_height => 300,
    :style => UI::HtmlDialog::STYLE_DIALOG  
  })

  
  $dialoginfo.set_file(__dir__ + '/28.ruby-call-js.html')
  $dialoginfo.show
  