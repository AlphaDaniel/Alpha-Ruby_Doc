require_relative './environment'
#============================================================= 

#========================pry patches========================== 
# comment out before push
require 'pry'
Pry::Commands.alias_command 'n', 'exit'
def x; exit!; end  
#=======================ruby patches========================== 
# replaces include
class Module
  def instances_can(*modules)
    modules.each(&method(:include))
  end
end

# replaces extend
class Module
  def can(*modules)
    modules.each(&method(:extend))
  end
end