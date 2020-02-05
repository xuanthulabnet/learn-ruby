# 19.group1.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/19.group1.rb"
require 'sketchup.rb'
require 'extensions.rb'
 
def group_demo1
    ents = Sketchup.active_model.entities

    face = ents.add_face [0,0,0], [1,0,0], [1,1,0], [0,1,0] 
    face.reverse!
    face.pushpull 1
    # Tạo Group - từ các Entity có kết nối với mặt face
    gr   = ents.add_group face.all_connected
    # Đặt tên Group
    gr.name = "Group Demo1"
end