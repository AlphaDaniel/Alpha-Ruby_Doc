class Klass
  can KeepCount
#=============================properties============================ 
  attr_accessor :type, :name, :url, :short, :documentation, :methods
#------------------------------------------------------------------- 
  @@all = []
  def self.all; @@all; end 
#=============================intialize============================= 
  # count = 125
  def initialize(type, name, url) 
    self.type = type
    self.name = name
    self.url = url
    @@all << self
    self.methods = []
  end
#===================================================================
end

