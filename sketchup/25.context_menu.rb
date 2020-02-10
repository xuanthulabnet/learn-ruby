# 25.context_menu.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/25.context_menu.rb"
require 'sketchup.rb'
require 'extensions.rb'

# Hàm chuyển các face đang chọn có vật liệu tô màu xanh
def makegreen 
    sel = Sketchup.active_model.selection
    sel.each do |e|
        if e.typename == "Face"
            e.material = [0, 255, 0]
        end
    end
end

# Hàm trả về MF_ENABLED nếu có face, MF_GRAYED nếu không
def check_face
    sel = Sketchup.active_model.selection
    ok = sel.find{ |e| e.typename == "Face"} 
    ok ? MF_ENABLED : MF_GRAYED
end

# Truy cập và sửa đổi context
UI.add_context_menu_handler do |menu|
    # @type [Sketchup::Menu]
    menu = menu
    # thêm đường phân cách
    menu.add_separator
    # Thêm menu item
    item = menu.add_item("Face -> Xanh") { makegreen }
    menu.set_validation_proc(item) {
        check_face
    }
end