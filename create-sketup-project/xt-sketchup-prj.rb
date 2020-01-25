#!/usr/bin/env ruby
#coding:utf-8

projectname = 'prj'
modulename  = 'XuanthuLab'
projectname = ARGV[0] unless ARGV[0].nil?
modulename  = ARGV[1] unless ARGV[1].nil?
puts "Create Project #{projectname}, module #{modulename}"

s = "require 'sketchup.rb'
require 'extensions.rb'

module #{modulename}
  unless file_loaded?(__FILE__)
    ex = SketchupExtension.new('#{projectname}', 'src/#{projectname}')
    ex.description = ''
    ex.version     = '1.0.0'
    ex.copyright   = 'XuanThuLab 2020'
    ex.creator     = 'xuanthulab.net'
    Sketchup.register_extension(ex, true)
    file_loaded(__FILE__)
  end

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
end
"
file = File.new("#{projectname}.rb", "w+")
file.puts(s)
file.close

Dir.mkdir 'src' unless Dir.exist?('src')

s = "require 'sketchup.rb'

module #{modulename}
    def self.create_cube
      model = Sketchup.active_model
      # doing something
    end

=begin    
    #  Thêm menu
    unless file_loaded?(__FILE__)
      menu = UI.menu('Plugins')
      menu.add_item('Tạo Cube') {
        self.create_cube
      }

      file_loaded(__FILE__)
    end
=end
end
"


file = File.new("src/main.rb", "w+")
file.puts(s)
file.close


Dir.mkdir '.vscode' unless Dir.exist?('.vscode')

s = '
{

    "version": "2.0.0",
    "tasks": [
      {
        "label": "Debug SketchUp 2017",
        "type": "shell",
        "command": "open -a \'/Applications/SketchUp 2919/SketchUp.app\' --args -rdebug \'ide port=7000\'",
        "windows": {
          "command": "&\'C:/Program Files/SketchUp/SketchUp 2019/SketchUp.exe\' -rdebug \'ide port=7000\'"
        }
      }
    ]
}
'
file = File.new(".vscode/tasks.json", "w+")
file.puts(s)
file.close


s= '{
    "version": "0.2.0",
    "configurations": [
      {
        "name": "Listen for rdebug-ide",
        "type": "Ruby",
        "request": "attach",
        "cwd": "${workspaceRoot}",
        "remoteHost": "127.0.0.1",
        "remotePort": "7000",
        "remoteWorkspaceRoot": "${workspaceRoot}"
      }
    ]
}
'
file = File.new(".vscode/lauch.json", "w+")
file.puts(s)
file.close


s= '{
    "solargraph.diagnostics": true
  }
'
file = File.new(".vscode/settings.json", "w+")
file.puts(s)
file.close



s= "
# To allow solargraph to resolve the require paths correctly, add the path
# to the Tools directory of one of your SketchUp installations.
# You also want to add the path to where you have the extension's sources.
# (In this example it would be in a `src` directory relative to .solargraph.yml)
require_paths:
- \"C:/Program Files/SketchUp/SketchUp 2018/Tools\"
- src

# This will load the stubs for the SketchUp API.
require:
- sketchup-api-stubs

# Exclude files that doesn't need to be parsed. Avoids noise and improve performance.
exclude:
- /build/**/*
- /ThirdParty/**/*
"
file = File.new(".solargraph.yml", "w+")
file.puts(s)
file.close

