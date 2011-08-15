# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "valideez/version"

Gem::Specification.new do |s|
  s.name        = "valideez"
  s.version     = Valideez::VERSION
  s.authors     = ["zaiste!"]
  s.email       = ["oh@zaiste.net"]
  s.homepage    = "http://dev.zaiste.net/gem/valideez"
  s.summary     = %q{Let's valideez lousy objects once and forever}
  s.description = %q{Your favourite validations with Ruby}

  s.rubyforge_project = "valideez"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
  s.add_development_dependency 'activemodel','>= 3.0.0'
end
