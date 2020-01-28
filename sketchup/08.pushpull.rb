# 08.pushpull.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/08.pushpull.rb"

require 'sketchup.rb'
require 'extensions.rb'

depth = 500.mm
width = 1000.mm
height = 400.mm
model = Sketchup.active_model
entities = model.active_entities
pts = []
pts[0] = [0, 0, 0]
pts[1] = [width, 0, 0]
pts[2] = [width, depth, 0]
pts[3] = [0, depth, 0]
# Tạo face
face = entities.add_face(pts)
# Lật mặt
face.reverse!
# Kẻ đường chéo (cắt qua mặt)
cut = entities.add_line pts[0], pts[2]
# Lấy mặt thứ nhất tiếp biên là đường chéo
firstface =  cut.faces[0]
# Lấy mặt thứ hai tiếp biên là đường chéo
secondface = cut.faces[1]
# đẩy 3D
status = firstface.pushpull(height, true)
status = secondface.pushpull(-height, true)
