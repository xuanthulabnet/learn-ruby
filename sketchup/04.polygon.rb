# 04.polygon.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/04.polygon.rb"

ents = Sketchup.active_model.entities
normal = [0, 0, 1] # pháp tuyến, mặt các đường vuông góc z
radius = 100.mm

# Đa giác 8 cạnh
ents.add_ngon [0, 0, 0], normal, radius, 8

# Hình tròn giác 8 cạnh
ents.add_circle [250.mm, 0, 0],  normal, radius, 8

# Đa giác 24 cạnh
ents.add_ngon [500.mm, 0, 0], normal, radius

# Hình tròn giác 24 cạnh
ents.add_circle [750.mm, 0, 0],  normal, radius
