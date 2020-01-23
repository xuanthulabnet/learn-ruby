
module Mymodule
  def tong(a, b)
    puts a + b
  end
  def hieu(a, b)
    puts a - b
  end  
end

class MyMath
  include Mymodule
end

m = MyMath.new
m.tong(1,2)     # 3
m.hieu(2,3)     # -1

