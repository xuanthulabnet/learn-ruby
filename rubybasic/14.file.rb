File.readlines("test.txt").each {
    |line| puts " --- #{line}"
  }

  puts File.readable?("test.txt") # true
puts File.writable?("test.txt")   # true
puts File.executable?("test.txt") # false

# Thêm các mặt tạo hình lập phương
depth = 100
width = 100
entities = Sketchup.active_model.active_entities
pts = []
pts[0] = [0, 0, 0]
pts[1] = [width, 0, 0]
pts[2] = [width, depth, 0]
pts[3] = [0, depth, 0]
face = entities.add_face(pts)




ents = Sketchup.active_model.entities
