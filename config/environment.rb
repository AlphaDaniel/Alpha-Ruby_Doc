# comment out before push
require_relative './patches'
#====================Requires=========================
require "bundler/setup"
require 'fileutils'
require 'colorize'
require 'open-uri'
require 'nokogiri'
require_relative '../lib/ruby_doc/version'
#======================Cli============================
require_relative '../lib/ruby_doc/cli/cli'
require_relative '../lib/ruby_doc/cli/ui'
#=====================Data============================
require_relative '../lib/ruby_doc/data/class'
require_relative '../lib/ruby_doc/data/method'
require_relative '../lib/ruby_doc/data/scraper'
require_relative '../lib/ruby_doc/data/data_processor'
#====================DataBase=========================
$DocDB = []
#===============Top Level Methods===================== 
def gem_folder(gem_name, version)
"#{Gem.path[0]}/gems/#{gem_name}-#{version}"
end
#====================Testing========================== 

#=====================================================