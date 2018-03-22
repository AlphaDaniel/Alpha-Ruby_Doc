
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruby_doc/version"

Gem::Specification.new do |spec|
  spec.name          = "ruby_doc"
  spec.version       = RubyDoc::VERSION
  spec.authors       = ["Daniel Nunez"]
  spec.email         = ["daniel.nunez.nyc@gmail.com"]

  spec.summary       = %q{THE ULTIMATE RUBY DEVELOPER REFERENCING TOOL!}
  spec.description   = %q{The ultimate Ruby developer tool. This gem scrapes Ruby documentation for quick referencing. Search or browse full documentation for classes, modules and/or methods. Including syntax examples, source Code, and even source links. Have a query? Run, Hunt, and Done. Never lose momentum, keep all things in your line of sight, and get right back to coding!}
  spec.homepage      = "https://github.com/AlphaDaniel/ruby_doc"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ['ruby_doc']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', '~> 3.7', '>= 3.7.0'
#============================================================== 
  spec.add_dependency "colorize", "~>0.8.1"
  spec.add_runtime_dependency 'nokogiri', '~> 1.8', '>= 1.8.1'
#==============================================================   
  # comment out before push
  spec.add_development_dependency "pry", "~>0.11.3"
#============================================================== 
end
