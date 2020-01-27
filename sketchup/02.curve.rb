# 02.curve.rb 
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/02.curve.rb"

ents = Sketchup.active_model.entities
p1 = [0,0,0]
p2 = [1,1,0]
p3 = [2,0,0]
p4 = [3,-1,0]
p5 = [4,0,0]

ents.add_text(p1.inspect, p1)
ents.add_text(p2.inspect, p2)
ents.add_text(p3.inspect, p3)
ents.add_text(p4.inspect, p4)
ents.add_text(p5.inspect, p5)

curve = ents.add_curve p1, p2, p3, p4, p5
curve.class         # Array (kiểm tra kiểu trả về)
curve.size          # Số Edge tạo ra = 4