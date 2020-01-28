# 09.followme.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/09.followme.rb"

require 'sketchup.rb'
require 'extensions.rb'
 
model = Sketchup.active_model 
ent = model.entities

circle = ent.add_circle [0,0,0], [0,0,1], 1
circle_face = ent.add_face circle

path = ent.add_curve [10,0,0], [10,0,5], [10,5,5], [10,5,0], [10,0,0]
circle_face.followme path