class Meth
  can KeepCount
#=========================properties========================= 
  attr_accessor :type, :name, :url, :documentation
#------------------------------------------------------------ 
  @@all = []
  def self.all; @@all; end 
#=========================intialize========================== 
  # count 1839
  def initialize(type="n/a", name, url) 
    self.type = type
    self.name = name
    self.url = url
    @@all << self
  end
#===========================find============================= 
  def self.find_by(url) 
    Meth.all.find{|m| m.url == url}
  end
#============================================================ 
end
