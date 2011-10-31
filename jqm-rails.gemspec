# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "jqm-rails/version"

Gem::Specification.new do |s|
  s.name        = "jqm-rails"
  s.version     = Jqm::Rails::VERSION
  s.authors     = ["Timo Uhlmann"]
  s.email       = ["timouhlmann@googlemail.com"]
  s.homepage    = ""
  s.summary     = "Use jQuery Mobile in rails"
  s.description = "Vendors the latest jQuery Mobile and provides some useful helper methods."

  s.rubyforge_project = "jqm-rails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
