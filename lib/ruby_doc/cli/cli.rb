module RubyDoc::CLI 
#======================================================
  def self.start_load 
    puts "\nThanks For Using ALPHA™ Ruby Docs!".cyan
    puts "One Moment Please As We Set Things Up\n".cyan
    Scraper.load_classes and Scraper.load_methods
    # binding.pry
    self.start
  end
#------------------------------------------------------  
  def self.start 
    UI.signature
    UI.main_menu
    UI.main_control
  end
#====================================================== 
end 
