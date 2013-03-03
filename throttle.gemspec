# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "throttle/version"

Gem::Specification.new do |s|
  s.name        = "throttle"
  s.version     = Throttle::VERSION
  s.authors     = ["brookemckim"]
  s.email       = ["brooke.mckim@gmail.com"]
  s.homepage    = "https://github.com/brookemckim/throttle"
  s.summary     = %q{Throttle bandwidth on OS X}
  s.description = %q{Throttle your local bandwidth with IPFW on OSX}

  s.rubyforge_project = "throttle"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency 'minitest', '~> 4.6.0'
  s.add_development_dependency 'mocha',    '~> 0.13.0'
end
