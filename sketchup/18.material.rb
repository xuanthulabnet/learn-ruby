# 18.material.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/18.material.rb"
require 'sketchup.rb'
require 'extensions.rb'

# Hàm tạo ra vật liệu mới với tên name
def create_matabc(name = "ABC")
    mats = Sketchup.active_model.materials
    new_mat = mats.find {|m| m.name == name}
    if (new_mat != nil)
        return new_mat
    end
    # Tạo mat mới
    new_mat = mats.add name
    # Thiết lập màu là đỏ
    # https://ruby.sketchup.com/Sketchup/Color.html
    new_mat.color = 'red'
    new_mat      
end

def crete_face
    ents = Sketchup.active_model.entities
 
    p1 = [0, 1, 0]
    p2 = [-0.951, 0.309, 0]
    p3 = [-0.588, -0.809, 0]
    p4 = [ 0.588, -0.809, 0] 
    p5 = [ 0.951, 0.309, 0]

    # tạo face
    face = ents.add_face p1, p2, p3, p4, p5
    face.reverse!

    # gọi phương thức tạo mat
    matabc = create_matabc

    # Gán material vào face
    face.material =  matabc
end

