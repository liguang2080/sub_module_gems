# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tencentpay/version"

Gem::Specification.new do |s|
  s.name        = "tencentpay"
  s.version     = Tencentpay::VERSION
  s.authors     = ["liguang"]
  s.email       = ["lg2046@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{财付通接口}
  s.description = %q{财付通接口 }

  s.rubyforge_project = "tencentpay"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "nokogiri"
end
