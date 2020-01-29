# Gọt đỉnh
# 10.chamfer.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/10.chamfer.rb"

require 'sketchup.rb'
require 'extensions.rb'
 
ents = Sketchup.active_model.entities

width  = 200.0;
depth  = 100.0;
height = 100.0;
delta  = 30.0;


main_face = ents.add_face [0,0,0], [width,0,0], [width,depth,0], [0,depth,0] 
main_face.reverse!
main_face.pushpull height, true

cut = ents.add_line [width, 0, height - delta], [width - delta, 0, height]

# Follow mặt bên trái (dưới) theo đường biên tạo face chính
cut.faces[1].followme main_face.edges