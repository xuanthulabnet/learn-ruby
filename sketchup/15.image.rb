# 15.image.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/15.image.rb"

require 'sketchup.rb'
require 'extensions.rb'
 

model = Sketchup.active_model
entities = model.active_entities
# Điểm chèn ảnh
point = Geom::Point3d.new 10,20,30
imgpath = "/Users/xuanthulab/Desktop/logo.png"
# Chèn ảnh
image = entities.add_image imgpath, point, 300
if (image)
  # Quay 90 độ quanh trục X
  tr = Geom::Transformation.new [0, 0, 0], [1, 0, 0], 90.degrees 
  entities.transform_entities tr, image
  UI.messagebox image
  
else
  UI.messagebox "Không chèn được"
end


