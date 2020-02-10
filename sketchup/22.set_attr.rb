# 22.set_attr.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/22.set_attr.rb"
require 'sketchup.rb'
require 'extensions.rb'

 
def set_attr(nameattr, valueattr, dictname = "mydic")
    ents = Sketchup.active_model.entities
    # @type [Sketchup::Entity]
    ent  = Sketchup.active_model.selection[0]
    if ent
        ent.set_attribute dictname, nameattr, valueattr
        puts "Đã thêm Attribute cho #{ent.to_s}"
    else
        puts "Không có đối tượng nào"
    end
end