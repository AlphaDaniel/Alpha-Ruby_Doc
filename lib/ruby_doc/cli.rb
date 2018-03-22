class RubyDoc::CLI 
  can Interact
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
    signature
    main_menu
    main_control
  end
#====================================================== 
end 
