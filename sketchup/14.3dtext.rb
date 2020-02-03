# 14.3dtext.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/14.3dtext.rb"

require 'sketchup.rb'
require 'extensions.rb'
 
ents = Sketchup.active_model.entities
# thêm group
group = ents.add_group

# lấy entities trong group
ents  = group.entities

string1 = "3D Text căn lề trái, font Times New Roman,\n
 cao 10.mm, dày 1.mm, có tolerance of 0.mm."

ents.add_3d_text string1, TextAlignLeft, "Times", false, false, 10.mm, 0.mm, 0, true, 1.mm

ents.transform_entities [100.mm, 200.mm, 50.mm], group
