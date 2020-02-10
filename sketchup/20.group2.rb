# 20.group2.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/20.group2.rb"
require 'sketchup.rb'
require 'extensions.rb'
 
def group_demo2
    ents = Sketchup.active_model.entities
    gr   = ents.add_group
    gr.name = "Group Demo2"
    entities_ingroup = gr.entities

    face = entities_ingroup.add_face [0,0,0], [1,0,0], [1,1,0], [0,1,0] 
    face.reverse!
    face.pushpull 1 
end
