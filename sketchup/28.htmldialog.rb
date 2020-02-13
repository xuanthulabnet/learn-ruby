# 28.htmldialog.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/28.htmldialog.rb"
require 'sketchup.rb'
require 'extensions.rb'



dialog = UI::HtmlDialog.new(
{
  :dialog_title => "Ví dụ HTML Dialog", 
  :preferences_key => "xuanthulab.net",   
  :scrollable => true,                   
  :resizable => true,               
  :width => 300,                 
  :height => 200,
  :left => 100,                
  :top => 100,
  :min_width => 50,
  :min_height => 50,
  :max_width =>500,                       
  :max_height => 300,
  :style => UI::HtmlDialog::STYLE_DIALOG  
})

dialog.set_file(__dir__ + '/file2.html')
dialog.show