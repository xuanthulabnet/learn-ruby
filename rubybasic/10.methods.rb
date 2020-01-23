# def xinchao
#     puts "Xin chào" 
# end    

# xinchao

# def tinhtong a, b = 5 
#     puts a + b
# end

# tinhtong 2, 10
s = 100
def sum *num
    s = 0;
    num.each {|v| s+=v}
    return  s
end

kq = sum(1,2,3)

puts s


 