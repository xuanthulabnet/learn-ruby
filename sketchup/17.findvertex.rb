# 17.findvertex.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/17.findvertex.rb"

require 'sketchup.rb'
require 'extensions.rb'

def findvertex
    ents = Sketchup.active_model.entities
    # mảng chứa các đỉnh
    vertex_array = []
    ents.each {|ent|
        if ent.typename == "Edge"
            # Hợp hai mảng duy nhất
            vertex_array = vertex_array | ent.vertices
        end
    } 
   return vertex_array
end

vertex_array = findvertex
puts vertex_array
vertex_array.each {|pt| puts "Các điểm: " + pt.position.to_s}
