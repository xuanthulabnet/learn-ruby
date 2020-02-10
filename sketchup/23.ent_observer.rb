# 23.ent_observer.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/23.ent_observer.rb"
require 'sketchup.rb'
require 'extensions.rb'

class MyEntityObserver < Sketchup::EntityObserver
    # Phương thức gọi khi thay đổi Entity 
    def onChangeEntity(entity)
        puts entity.to_s
        puts entity.typename + " changed"
    end    
    # Nhận thông báo khi xóa Entity
    def onEraseEntity(entity)
        puts entity.typename + " erased"
    end    
end

def set_all_enties_observer
    # Thiết lập đăng ký Entity
    entites = Sketchup.active_model.entities
    obs = MyEntityObserver.new
    entites.each {
        |ent|
        is_ent = ent.class.ancestors.include? Sketchup::Entity 
        if is_ent
            puts ent.class.to_s
            ent.add_observer obs
        end
    }
end