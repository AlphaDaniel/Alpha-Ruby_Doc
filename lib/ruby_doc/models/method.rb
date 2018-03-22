class Meth 
  can Track; can Find
#=========================properties========================= 
  attr_accessor :type, :name, :url, :documentation 
#=========================intialize========================== 
  def initialize(type="n/a", name, url) 
    self.type = type
    self.name = name
    self.url = url
    @@all << self
  end
#============================================================ 
end
