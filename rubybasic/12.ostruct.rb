# require 'ostruct'
# person = OpenStruct.new(name:'John Smith', 'age' => 70)
# person[:age]  
# puts person.name
# puts Math.sqrt(4)      # => 2/3


# current time
t = Time.now
puts t

# year, month, day
puts t.year
puts t.month
puts t.day

# custom date
t = Time.new(1988, 6, 10)

# day of week: 0 is Sunday
puts t.wday

# day of year
puts t.yday
