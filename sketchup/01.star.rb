=begin
Vẽ ngôi sao năm cánh, bán kính ngôi sao r = 100.mm
=end
def to_radian(degrees)
    degrees * Math::PI / 180
end

r = 100.mm

ents = Sketchup.active_model.entities

pt1 = [r * Math.cos(to_radian(18)),  r * Math.sin(to_radian(18)),  0]     # góc 18 
pt2 = [r * Math.cos(to_radian(90)),  r * Math.sin(to_radian(90)),  0]     # góc 90
pt3 = [r * Math.cos(to_radian(162)), r * Math.sin(to_radian(162)), 0]     # góc 162
pt4 = [r * Math.cos(to_radian(225)), r * Math.sin(to_radian(225)), 0]     # góc 225
pt5 = [r * Math.cos(to_radian(-45)), r * Math.sin(to_radian(-45)), 0]     # góc -45

ents.add_face pt1, pt3
ents.add_face pt1, pt4 
ents.add_face pt2, pt5 
ents.add_face pt2, pt4 
ents.add_face pt3, pt5


