# 21.component.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/21.component.rb"
require 'sketchup.rb'
require 'extensions.rb'
 
def create_com
    # Tạo ComponentDefinition tên Cube
    list = Sketchup.active_model.definitions
    comp_def = list.add "Khối lập phương"
    comp_def.description = "Đây là component khối lập phương."
    # Thêm các Entity vào
    ents = comp_def.entities
    face = ents.add_face [0,0,0], [1,0,0], [1,1,0], [0,1,0] 
    face.reverse!
    face.pushpull 1
    # Lưu ra file
    save_path = Sketchup.find_support_file "Components", "" 
    comp_def.save_as(save_path + "/myshape.skp")
    puts "Path: " + comp_def.path
end