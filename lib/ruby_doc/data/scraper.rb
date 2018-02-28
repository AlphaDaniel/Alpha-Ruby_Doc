class Scraper < UI 
#===========================LOAD CLASSES================================= 
  def self.load_classes 
    @counter = 0 #For Loading anim
    loading_message#
    
    html = Nokogiri::HTML(open("https://ruby-doc.org/core-2.4.3/"))
    icontainer = html.search("#class-index .entries")
    
    icontainer.search("p").each do |li| 
      name = li.search("a").text
      url = UI.rdo_prefix + li.search("a")[0]["href"]
      type = li["class"].capitalize
      
      # assigns - Klass :names, :urls
      doc = Klass.new(type, name, url) if class_uniq(url)
      # keeps copy in DocDB
      $DocDB << doc if doc_uniq(url)
    end
  end 
#===========================LOAD METHODS================================= 
  def self.load_methods 
    html = Nokogiri::HTML(open("https://ruby-doc.org/core-2.4.3/"))
    icontainer = html.search("#method-index .entries")
    
    icontainer.search("a").each do |li|
      name = li.text
      url = UI.rdo_prefix + li["href"]
      type = "Method"
      
      # assigns - Method :names, :urls
      doc = Meth.new("Method", name, url) if method_uniq(name) 
      # keeps copy in DocDB
      $DocDB << doc if doc_uniq(name)
      
      @counter += 1 #For Loading anim
      loading_animation#
    end
  end 
#==========================LOAD CLASS DOC================================ 
  def self.load_class_doc(doc) 
    html = Nokogiri::HTML(open(doc.url))
#--------------------------documentation--------------------------------- 
    container = html.search("#description")
    
    short = container.search("p")[0].text + "\n"
    
    text = "" 
    container.search("p, pre, h2").each {|p| text << p.text + "\n\n"} 
    
    # assign 
    doc.short = short
    doc.documentation = text
#-----------------------------methods------------------------------------ 
    methods = html.search("ul.link-list a")
    
    methods.each do |m| 
      url = doc.url + m["href"] 
      method = Meth.find_by(url) 
      
      doc.methods << method if class_method_uniq(doc, method)
    end
  end
#=========================LOAD METHOD DOC================================ 
  def self.load_method_doc(doc) 
    html = Nokogiri::HTML(open(doc.url))
#--------------------------documentation--------------------------------- 
    selector = "#"+doc.url.gsub(/.+#method.{3}/, "")+"-method"
    
    # if method is alias (linked to another method)
    if html.search("#{selector}").first["class"].include?("method-alias")
      
      conn = html.search("#{selector}").first.search("a")[1]["href"] 
      rebuild = "#"+ conn.gsub(/.+#method.{3}/, "")+"-method" 
      
      container = html.search(rebuild)[0] 
    
      text = "" 
      text << html.search("#{selector} div.aliases").first.text + "\n\n" 
      container.search("p, pre, h2").each {|p| text << p.text + "\n\n" }  
      
      # assign 
      doc.documentation = text
    else
      container = html.search(selector)[0]
    
      text = "" 
      container.search("p, pre, h2").each {|p| text << p.text + "\n\n" } 
      
      # assign 
      doc.documentation = text
    end 
  end 
#=============================HELPERS==================================== 
  def self.class_uniq(url) 
    Klass.all.none?{|klass| klass.url == url}
  end
  
  def self.method_uniq(name)  
    Meth.all.none?{|method| method.name == name}
  end
  
  def self.doc_uniq(name) 
    $DocDB.none?{|doc| doc.name == name}
  end
  
  def self.class_method_uniq(doc, method)
    doc.methods.none?{|m| m == method }
  end 
#===========================LEARN MORE=================================== 
  def self.coming_soon 
    html = Nokogiri::HTML(open("https://github.com/AlphaDaniel/ruby_doc/blob/master/README.md")) 
    
    list = ""
    html.search("div#readme ul li").each do |li| 
       list << ">> ".cyan + li.text + "\n"
    end
    list
  end
  
  def self.changelog 
    html = Nokogiri::HTML(open("https://github.com/AlphaDaniel/ruby_doc/blob/master/changelog.md"))  
    
    html.search("#readme").text.gsub("\n    ", "").gsub("\n\n\n  ", "") + "\n\n"
  end
#======================================================================== 
end