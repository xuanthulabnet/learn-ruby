# 12.translation.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/12.translation.rb"

require 'sketchup.rb'
require 'extensions.rb'
 
ents = Sketchup.active_model.entities
tran_face = ents.add_face [-1, -1, 0], [-1, 1, 0], [1, 1, 0], [1, -1, 0]
t = Geom::Transformation.new [4, 0, 0]
ents.transform_entities t, tran_face

t = Geom::Transformation.new [0, 6, 0]
ents.transform_entities t, tran_face
ents.transform_entities [-3, 0, 0], tran_face

