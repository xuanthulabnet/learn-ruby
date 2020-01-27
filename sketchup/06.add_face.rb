# 06.add_face.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/06.add_face.rb"
require 'sketchup.rb'
require 'extensions.rb'

ents = Sketchup.active_model.entities
p1 = [0, 1, 0]
p2 = [-0.951, 0.309, 0]
p3 = [-0.588, -0.809, 0]
p4 = [ 0.588, -0.809, 0] 
p5 = [ 0.951, 0.309, 0]

# tạo face
face = ents.add_face p1, p2, p3, p4, p5
# Duyệt qua các đỉnh của face, thêm text ghi chú
face.vertices.each {
    |point|
    s = point.position.to_s
    ents.add_text(s, point.position, [0.1, 0.1, 0])
}
# lặt mặt
face.reverse!