# class Product
#     def initialize(name)
#       @name = name
#     end
#     # Định nghĩa getter để đọc biến @name
#     def name
#       @name
#     end
#     # Định nghĩa setter để cập nhật biến
#     def name=(name)
#       @name = name
#     end
#   end
  
#   p = Product.new("Iphone")

#   p.name = "Laptop"        # Gọi setter            
#   puts p.name              # Gọi getter
#   # Laptop
  
  



# class Xinchao
#     # Phương thức lớp có tên hello
#     def self.hello
#         puts "Xin chào"
#     end
# end

# # Gọi phương thức lớp qua tên lớp
# Xinchao.hello


# class Product
#     @@total = 10
#     def self.total 
#         @@total
#     end
#     def self.total=(total)
#         @@total = total
#     end
# end

# Product.total = 100
# puts Product.total




# class Calc
#   PI = 3.14
# end
# puts Calc::PI






# class Product
#   @name = ''
#   def initialize
#     @name = 'Iphone'
#   end

#   def to_s
#     "Sản phẩm #{@name}"
#   end
# end

# p = Product.new
# puts p



# class Person
#     attr_accessor :name, :age                     # khai báo này tự động có các phương thức name,name=, age, age=
#     def initialize(name, age)
#       @name = name
#       @age = age
#     end
#     def change(n, a)
#       self.name = n                               # truy cập accessor setter trong lớp thì cần dùng self.
#       self.age = a
#     end
#     def show_info
#       puts "#{self.name} is #{self.age}"          # truy cập accessor getter trong lớp thì cần dùng self.
#     end
#   end
  
#   p = Person.new("David", 28)
#   p.change("Bob", 42)
#   p.show_info
#   puts p.age



class Person
    def initialize(age)
      @age = age
    end
    def show
      puts "#{@age} years = #{days_lived} days"
    end
  
    private
    def days_lived
      @age * 365
    end
end
  
p = Person.new(42)
p.show
p.days_lived