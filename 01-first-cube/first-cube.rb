require 'sketchup.rb'
require 'extensions.rb'

module XuanThuLab
  module MyCube
     unless file_loaded?(__FILE__)
      ex = SketchupExtension.new('My Cube', 'src/main')
      ex.description = 'Tạo khối Cube'
      ex.version     = '1.0.0'
      ex.copyright   = 'XuanThuLab 2016'
      ex.creator     = 'xuanthulab.net'

      
      Sketchup.register_extension(ex, true)
      file_loaded(__FILE__)
    end

    # Nạp lại File extension (main.rb)
    # Để gõ vào Console: XuanThuLab::MyCube.reload thì nạp lại Extension này mà không cần
    # khởi động lại Sketchup    
    def self.reload
      original_verbose = $VERBOSE
      $VERBOSE = nil
      pattern = File.join(__dir__, '**/*.rb')
      
      Dir.glob(pattern).each { |file|
        load file
      }.size
    ensure
      $VERBOSE = original_verbose
    end

  end # module XuanThuLab
end # module MyCube
