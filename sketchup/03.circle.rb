# 03.circle.rb 
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/03.circle.rb"

ents = Sketchup.active_model.entities
c = [150.mm,150.mm,100.mm] # tâm
n = [200.mm,200.mm,200.mm] # pháp tuyến
r = 150.mm                 # bán kính
s = 10                     # số phân đoạn 

# ents.add_text(p5.inspect, p5)

circle = ents.add_circle c, n, r, s
normal = ents.add_line [0,0,0], n
ents.add_text("Đường pháp tuyến", n, Geom::Vector3d.new(20.mm, 20.mm, 0))
ents.add_text("Tâm", c, [50.mm, 0.mm, 0])
