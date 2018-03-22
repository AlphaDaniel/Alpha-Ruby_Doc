require_relative './patches'
#====================Requires==============================
require "bundler/setup"
require 'fileutils'
require 'colorize'
require 'open-uri'
require 'nokogiri'
require_relative '../lib/ruby_doc/version'
#=========================Concerns========================= 
require_relative '../lib/ruby_doc/concerns/track'
require_relative '../lib/ruby_doc/concerns/find'
#===========================Cli============================ 
require_relative '../lib/ruby_doc/cli/cli'
require_relative '../lib/ruby_doc/cli/ui'
#===========================Data=========================== 
require_relative '../lib/ruby_doc/data/class'
require_relative '../lib/ruby_doc/data/method'
require_relative '../lib/ruby_doc/data/scraper'
require_relative '../lib/ruby_doc/data/data_processor'
#=========================DataBase========================= 
$DocDB = []
#========================Favorites========================= 
def fav_dir
  File.expand_path("../favs.txt", __dir__)  
  # "#{Gem.path[0]}/gems/ruby_doc-#{RubyDoc::VERSION}/favs.txt"
end
FileUtils::touch "#{fav_dir}"
#=========================Testing========================== 

#========================================================== 

