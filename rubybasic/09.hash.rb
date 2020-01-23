product = {:name => :Iphone, :price => 500, :color => "white"}
puts product[:name]
# Iphone
cars = {
    "bmw" => { year:2016, color:"red"},
    "mercedes" => { year:2012, color:"black"},
    "porsche" => { year:2014, color:"white"}
  }
  puts cars["bmw"][:color]

sizes = {svga:800, hd:1366, uhd:3840}
sizes.each { |key, value| puts "#{key}=>#{value}" }