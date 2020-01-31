# 11. transform.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/11. transform.rb"

require 'sketchup.rb'
require 'extensions.rb'
 
ents = Sketchup.active_model.entities

# tr = Geom::Transformation.translation [0, 0, 5]
# ents.transform_entities tr, roof_line

face = ents.add_face([0,0,0], [100, 0, 0], [100,100,0], [0,100,0])
face.reverse!
face.pushpull 50, true
roof_line = ents.add_line [0, 50, 50], [100, 50, 50]


vector = [0,0, 30]
tr = Geom::Transformation.translation vector
ents.transform_entities tr, roof_line


