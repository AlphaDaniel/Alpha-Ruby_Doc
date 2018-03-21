
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruby_doc/version"

Gem::Specification.new do |spec|
  spec.name          = "ruby_doc"
  spec.version       = RubyDoc::VERSION
  spec.authors       = ["Daniel Nunez"]
  spec.email         = ["daniel.nunez.nyc@gmail.com"]

  spec.summary       = %q{THE ULTIMATE RUBY DEVELOPER REFERENCING TOOL!}
  spec.description   = %q{Ruby Doc aims to make Ruby referencing quick and painless. This gem scrapes Ruby documentation and allows users to quickly reference Ruby classes, modules and methods all on your terminal in STYLE! Features include Search by Name, Paginated Browsing, Full documentation including Syntax and Source Code, Save to Favorites, Source Links, Seamless Navigation, and more. Have a query? Run, Hunt, and Done. Never lose momentum, keep all things in your line of sight, and get right back to coding!}
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
  # spec.add_development_dependency "pry", "~>0.11.3"
#============================================================== 
end
