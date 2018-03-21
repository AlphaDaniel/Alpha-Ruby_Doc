require "bundler/gem_tasks"
require 'rspec/core/rake_task'
task :default => :spec

require_relative './config/environment'
Scraper.load_classes and Scraper.load_methods

task :console do
  Pry.start
end

RSpec::Core::RakeTask.new