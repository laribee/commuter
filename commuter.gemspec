# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "commuter/version"

Gem::Specification.new do |s|
  s.name        = "commuter"
  s.version     = Commuter::VERSION
  s.authors     = ["David Laribee"]
  s.email       = ["laribee@gmail.com"]
  s.homepage    = "https://github.com/laribee/commuter"
  s.summary     = %q{Gives you google maps travel times between two addresses.}
  s.description = %q{Gives you google maps travel times between two addresses.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib", "bin"]

  s.add_runtime_dependency "commander"
  s.add_runtime_dependency "mechanize"
end
