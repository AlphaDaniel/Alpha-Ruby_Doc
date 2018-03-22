module ProcessData 
#=============================Browse Pages============================ 
  def page1 
    browse_list($DocDB[0..499], "Page1")
  end
  
  def page2 
    browse_list($DocDB[500..999], "Page2")
  end
  
  def page3 
    browse_list($DocDB[1000..1499], "Page3")
  end
  
  def last 
    browse_list($DocDB[1500..$DocDB.count], "Last")
  end
#===============================Load Doc============================== 
  def load_doc(doc) 
    if !doc.nil?
      Scraper.load_class_doc(doc) if doc.type == "Class" || doc.type == "Module"
      Scraper.load_method_doc(doc) if doc.type == "Method"
      
      display_class(doc) if doc.type == "Class" || doc.type == "Module"
      display_method(doc) if doc.type == "Method"
    else 
      nil_error
    end
  end
#===============================Save Doc============================== 
  def save(doc) 
    # if entry does not exist write else inform entry exist
    if uniq(doc) 
      File.open("#{fav_dir}", "a"){|l| l.puts doc.name}
      puts "\r"
      print doc.name.cyan + " Saved!".light_cyan
      
      display_class_control(doc)
    else 
      puts "\r"
      print doc.name.cyan + " Already Saved!".light_red
      
      display_class_control(doc)
    end
  end
  
  def uniq(doc) # save(doc) Helper Method 
    # read => uniq boolean
    File.open("#{fav_dir}").none?{|l| l.chomp == doc.name}
  end
#===============================Find Fav============================== 
  def find_fav(name) 
    doc = $DocDB.find{|doc| doc.name == name}
    
    load_doc(doc) 
  end 
#==============================Reset Favs============================= 
  def reset_favs 
    open("#{fav_dir}", File::TRUNC) {}
    
    reset_favs_message
  end
#================================SEARCH=============================== 
  def search(name)
    $DocDB.find_all{|doc| doc.name.downcase.include?(name)}
  end
#=====================================================================
end
