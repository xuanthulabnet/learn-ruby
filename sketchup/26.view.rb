# 26.view.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/26.view.rb"
require 'sketchup.rb'
require 'extensions.rb'

view = Sketchup.active_model.active_view
# In ra kích thước Window
h = view.vpheight.to_s;
w = view.vpwidth.to_s
puts "Kích thước: " + w + ", " + h
# Tọa của Gốc Model khi chuyển vào View
origin = view.screen_coords [0,0,0]
puts "Origin: " + origin[0].to_f.to_s + ", " + origin[1].to_f.to_s

# Xác định 50 pixel trong View tương ứng với độ dài bao nhiêu trong Model
size = view.pixels_to_model 50, [0, 0, 0]
puts "Size of a 50-pixel line at the origin: " + size.to_s