module Find
#=========================By Url=========================== 
  def find_by(url) 
    self.all.find{|doc| doc.url == url}
  end
#========================================================== 
end