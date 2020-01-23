=begin
a = 4
b = 2
if a > b
    puts "#{a} lớn hơn #{b}"
end


a = 10
if a > 1
    puts "a lớn hơn 1"
    if a < 20
        puts "a cũng nhỏ hơn 20"
    end    
end

=end


a = 1
b = 2
if a > b
    puts "#{a} lớn hơn #{b}"
else
    puts "#{a} nhỏ hơn #{b}"     
end


a = 100
puts "a chia hết cho 2" if a % 2 == 0

puts "a không chia hết cho 2" unless a % 2 == 0


dow = 2
case dow
when 0
  puts "Chủ nhật"
when 1
  puts "Thứ Hai"
when 2
  puts "Thứ Ba"
end


dow = 3
case dow
when 0,7
  puts "Ngày nghỉ"
when 1,2,3,4,6
  puts "Ngày làm việc"
end


dow = 5
case dow
when 0,7
  puts "Ngày nghỉ"
when 1
  puts "Học PHP"
when 2,3
    puts "Học Ruby"
else
    puts "Học Linux"      
end

# Học Linux