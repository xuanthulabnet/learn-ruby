# 07.face_checkpoint.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/07.face_checkpoint.rb"

require 'sketchup.rb'
require 'extensions.rb'

model = Sketchup.active_model
entities = model.active_entities
pts = []
pts[0] = [0, 0, 0]
pts[1] = [9, 0, 0]
pts[2] = [9, 9, 0]
pts[3] = [0, 9, 0]

# Thêm face
face = entities.add_face(pts)

pt = Geom::Point3d.new(10, 10, 0)
result = face.classify_point(pt)
if result == Sketchup::Face::PointOutside
  entities.add_text("#{pt.to_s} nằm ngoài face (#{result})", pt, [1,1,1])
end

pt = Geom::Point3d.new(4, 1, 0)
result = face.classify_point(pt)
if result == Sketchup::Face::PointInside
    entities.add_text("#{pt.to_s} nằm trong face (#{result})", pt, [1,1,1])
end


pt = Geom::Point3d.new(0, 0, 0)
result = face.classify_point(pt)
if result == Sketchup::Face::PointOnVertex
    entities.add_text("#{pt.to_s} trên đỉnh face (#{result})", pt, [1,1,1])
end

pt = Geom::Point3d.new(0, 4, 0)
result = face.classify_point(pt)
if result == Sketchup::Face::PointOnEdge
    entities.add_text("#{pt.to_s} trên biên face (#{result})", pt, [1,1,1])
end

pt = Geom::Point3d.new(4, 4, 4)
result = face.classify_point(pt)
if result == Sketchup::Face::PointNotOnPlane
  entities.add_text("#{pt.to_s} không thuộc mặt face (#{result})", pt, [1,1,1])
end
