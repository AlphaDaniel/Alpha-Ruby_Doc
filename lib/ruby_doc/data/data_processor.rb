class Processor  
#=============================Browse Pages============================ 
  def self.page1 
    UI.browse_list($DocDB[0..499], "Page1")
  end
  
  def self.page2 
    UI.browse_list($DocDB[500..999], "Page2")
  end
  
  def self.page3 
    UI.browse_list($DocDB[1000..1499], "Page3")
  end
  
  def self.last 
    UI.browse_list($DocDB[1500..$DocDB.count], "Last")
  end
#===============================Load Doc============================== 
  def self.load_doc(doc) 
    if !doc.nil?
      Scraper.load_class_doc(doc) if doc.type == "Class" || doc.type == "Module"
      Scraper.load_method_doc(doc) if doc.type == "Method"
      
      UI.display_class(doc) if doc.type == "Class" || doc.type == "Module"
      UI.display_method(doc) if doc.type == "Method"
    else 
      UI.nil_error
    end
  end
#===============================Save Doc============================== 
  def self.save(doc) 
    # if entry does not exist write else inform entry exist
    if uniq(doc) 
      File.open("#{gem_folder("ruby_doc", "2.1.1")}/favs.txt", "a"){|l| l.puts doc.name}
      puts "\r"
      print doc.name.cyan + " Saved!".light_cyan
      
      UI.display_class_control(doc)
    else 
      puts "\r"
      print doc.name.cyan + " Already Saved!".light_red
      
      UI.display_class_control(doc)
    end
  end
  
  def self.uniq(doc) # save(doc) Helper Method 
    # read => uniq boolean
    File.open("#{gem_folder("ruby_doc", "2.1.1")}/favs.txt").none?{|l| l.chomp == doc.name}
  end
#===============================Find Fav============================== 
  def self.find_fav(name) 
    doc = $DocDB.find{|doc| doc.name == name}
    
    load_doc(doc) 
  end  
#================================SEARCH=============================== 
  def self.search(name)
    $DocDB.find_all{|doc| doc.name.downcase.include?(name)}
  end
#=====================================================================
end
