# 16.findface.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/16.findface.rb"

require 'sketchup.rb'
require 'extensions.rb'

def findface(normal = [0,0,1])
    # Tìm 1 Face đầu tiên có pháp tuyến normal
    Sketchup.active_model.selection.clear           # xóa selection
    ents = Sketchup.active_model.entities
    xface = ents.find {|ent| ent.typename == "Face" &&
    ent.normal == normal}
    puts "The face is: " + xface.to_s
    Sketchup.active_model.selection.add xface       # thêm kết quả tìm vào selection
end

def findface_all(normal = [0,0,1])
    # Tìm tất cả các mặt có pháp tuyến normal
    Sketchup.active_model.selection.clear
    ents = Sketchup.active_model.entities
    # Duyệt qua tất cả các Entity, tìm các Face trả về mảng
    faces = ents.find_all {|ent| ent.typename == "Face" &&
        ent.normal == normal}
    puts "Founds: #{faces.length}"    
    # Duyệt qua tất cả các Face tìm được
    faces.each {
        |face| 
        puts face.to_s
    }
    Sketchup.active_model.selection.add faces
end