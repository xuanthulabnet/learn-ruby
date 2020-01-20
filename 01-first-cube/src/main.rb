require 'sketchup.rb'

module XuanThuLab
  module MyCube
    def self.create_cube
      # Lấy model hiện tại của Sketchup
      model = Sketchup.active_model
      # Các hoạt động tác động vào model nằm giữa  model.start_operation và
      # model.commit_operation để đảm bảo có thể phục hồi (undo)
      model.start_operation('Create Cube', true)

      # Tạo ra group mới và lấy mảng chứa các entity của group
      group = model.active_entities.add_group
      entities = group.entities

 
      

      # Định nghĩa mảng tọa độ các điểm
      points = [
        Geom::Point3d.new(0,   0,   0),
        Geom::Point3d.new(1.m, 0,   0),
        Geom::Point3d.new(1.m, 1.m, 0),
        Geom::Point3d.new(0,   1.m, 0)
      ]



      # Tạo face từ các điểm
      face = entities.add_face(points)

      # thực hiện push face tạo khối 3D
      face.pushpull(-2.m)

      puts entities
 
      model.commit_operation
      
    end

    #  Thêm menu
    unless file_loaded?(__FILE__)
      menu = UI.menu('Plugins')
      menu.add_item('Tạo Cube') {
        self.create_cube
      }

      file_loaded(__FILE__)
    end 
  end # module HelloCube
end # module Examples
