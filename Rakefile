require "bundler/gem_tasks"
require 'rspec/core/rake_task'
task :default => :spec

require_relative './config/environment'

task :console do
  Pry.start
end

RSpec::Core::RakeTask.new