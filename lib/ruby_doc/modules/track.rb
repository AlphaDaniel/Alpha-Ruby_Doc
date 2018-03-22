module Track
#==========================Count=========================== 
  def count
    self.all.count
  end
#==========================@@All=========================== 
  # @@all SETTER/GETTER
  def self.extended(base)
    base.class_variable_set(:@@all, [])
  end
  
  def all
    self.class_variable_get(:@@all)
  end
#=========================Aliases========================== 
  # @@all alias
  def s 
    self.all
  end
  # @@all.first alias
  def f 
    self.all.first
  end
  # @@all.last alias
  def l 
    self.all.last
  end
#========================================================== 
end