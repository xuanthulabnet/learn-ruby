# 13.rotate.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/13.rotate.rb"

require 'sketchup.rb'
require 'extensions.rb'
 
ents = Sketchup.active_model.entities

# tạo hình tròn (tậm trên x)
circle = ents.add_circle [50,0,0], [0,0,1], 10, 24
# Transformation quay 30 độ quanh z
t = Geom::Transformation.new [0, 0, 0], [0, 0, 1], 30.degrees
ents.transform_entities t, circle

# Quay 60 độ quanh z
t = Geom::Transformation.rotation [0, 0, 0], [0, 0, 1], 60.degrees
ents.transform_entities t, circle