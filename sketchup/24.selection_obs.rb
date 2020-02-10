# 24.selection_obs.rb
# load "/Users/xuanthulab/Desktop/learn-ruby/sketchup/24.selection_obs.rb"
require 'sketchup.rb'
require 'extensions.rb'

class SelObserver < Sketchup::SelectionObserver
    # Gọi khi một Entity thêm vào Selection
    def onSelectionAdded(selection, entity)
        puts "onSelectionAdded: #{entity}"
    end      

    def onSelectionBulkChange(selection)
        selection.each {|e| puts e}
    end
    # Khi selection rỗng
    def onSelectionCleared(selection)
        puts "Không chọn Entity nào"
    end      
end
sel = Sketchup.active_model.selection 
selob = SelObserver.new

sel.add_observer selob
# sel.remove_observer selob


cmd = UI::Command.new("Xin chào 2") {
    UI.messagebox("Xin chào 2")
}
menu = UI.menu('View')
menu.add_item(cmd)

