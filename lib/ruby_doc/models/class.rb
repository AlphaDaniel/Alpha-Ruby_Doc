class Klass 
  can Track; can Find
#=============================properties============================ 
  attr_accessor :type, :name, :url, :short, :documentation, :methods
#=============================intialize============================= 
  def initialize(type, name, url) 
    self.type = type
    self.name = name
    self.url = url
    @@all << self
    self.methods = []
  end
#===================================================================
end

