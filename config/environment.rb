#=========================Gems/App========================= 
  require_relative './patches'
  require "bundler/setup"
  require 'fileutils'
  require 'colorize'
  require 'open-uri'
  require 'nokogiri'
  require_relative '../lib/ruby_doc/version'
#=========================Modules========================== 
  require_relative '../lib/ruby_doc/modules/track'
  require_relative '../lib/ruby_doc/modules/find'
  require_relative '../lib/ruby_doc/modules/interact'
#==========================Models========================== 
  require_relative '../lib/ruby_doc/models/class'
  require_relative '../lib/ruby_doc/models/method'
#========================================================== 
  require_relative '../lib/ruby_doc/cli'
  require_relative '../lib/ruby_doc/scraper'
#====================All Docs Container==================== 
  $DocDB = []
#========================Favorites========================= 
  def fav_dir 
    File.expand_path("../favs.txt", __dir__)  
    # "#{Gem.path[0]}/gems/ruby_doc-#{RubyDoc::VERSION}/favs.txt"
  end
  FileUtils::touch "#{fav_dir}"
#========================================================== 


#=========================Testing========================== 
#========================================================== 

