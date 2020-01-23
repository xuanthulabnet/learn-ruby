# xinchao = Proc.new do |name|
#     puts "Xin chào #{name}"
# end
  
# xinchao.call "XuanThuLab"
# # Welcome XuanThuLab


# tong = Proc.new do |a, b|
#     a + b
# end

# hieu = Proc.new do |a, b|
#     a - b
# end

# def tinhtoan(pheptinh, a, b) 
#   puts "Kết quả tính #{pheptinh.call(a, b)}"
  
# end

# tinhtoan(tong, 1, 2)
# tinhtoan(hieu, 1, 2)

xinchao = Proc.new do |name|
    puts "Xin chào #{name}"
end

xinchao.call("XTL")
xinchao.call
