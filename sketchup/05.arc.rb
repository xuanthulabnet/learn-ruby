# 05.arc.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/05.arc.rb"

ents        = Sketchup.active_model.entities
center      = [0,0,0]            # tâm
normal      = [0, 0, 1]          # pháp tuyến, mặt các đường vuông góc z
radius      = 100.mm
start_angle = 0.degrees
end_angle   = 160.degrees
zezo_vector = [110.mm,0,0]       # lấy trục x làm gốc

ents.add_arc center, zezo_vector, normal, radius, start_angle, end_angle, 20
ents.add_line [0,0,0], zezo_vector
ents.add_text("Vecto gốc", zezo_vector, [50.mm, 0.mm, 0])
