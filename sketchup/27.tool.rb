# 27.tool.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/27.tool.rb"
require 'sketchup.rb'
require 'extensions.rb'

## Công cụ vẽ Line
class MyLineTool
  # Gọi khi kích hoạt công cụ  
  def activate
    puts 'Kích hoạt Tool'
    # InputPoint để nhấn chuột chọn các Entity
    @input  = Sketchup::InputPoint.new
    # @type [Sketchup::Point3d] điểm thứ nhất
    @point1 = nil
    # @type [Sketchup::Point3d] điểm thứ 2
    @point2 = nil
    # @type [Sketchup::Point3d] điểm chuột
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
  # Vẽ thông tin trong View
  def draw(view) 
    options = {
      :font => "Arial",
      :size => 20,
      :bold => true,
      :align => TextAlignRight
    }
    point = Geom::Point3d.new(200, 200, 0)
    view.draw_text(point, "Test - Đây là công cụ Line", options)

    view.drawing_color = Sketchup::Color.new(255, 0, 0, 64)
    if !@pointmove.nil?
        # Vẽ điểm tại chuột
        status = view.draw_points @pointmove, 10, 2, "red"
    end

    if !@pointmove.nil? && !@point1.nil?
        # Vẽ line trong View
        status = view.drawing_color="red"
        status = view.draw_lines @point1, @pointmove 
            
    end 
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
        
        if !@point1.nil?
            @point2 = @input.position
        elsif 
            @point1 = @input.position
            Sketchup.set_status_text "Nhập điểm 2", SB_VCB_LABEL
        end

        if !@point1.nil? && !@point2.nil?
            Sketchup.active_model.entities.add_line @point1, @point2    
            Sketchup.active_model.select_tool nil
        end
        
    end

end

if( not file_loaded? "27.tool.rb" )
    # Tạo menu chọn công cụ
    simple_cmd = UI::Command.new("MyLineTool") {
        # Chọn công cụ
        Sketchup.active_model.select_tool MyLineTool.new 
    }
    tool_menu = UI.menu "Tools" 
    tool_menu.add_separator 
    tool_menu.add_item simple_cmd
    file_loaded "27.tool.rb"
end