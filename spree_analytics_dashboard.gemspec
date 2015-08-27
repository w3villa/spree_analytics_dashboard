# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spree_analytics_dashboard/version'

Gem::Specification.new do |spec|
  spec.name          = "spree_analytics_dashboard"
  spec.version       = SpreeAnalyticsDashboard::VERSION
  spec.authors       = ["Ishank Gupta"]
  spec.email         = ["ishank@w3villa.com"]
  spec.summary       = %q{Dashboard for spree traffic}
  spec.description   = %q{Dashboard for spree traffic}
  spec.homepage      = "http://w3villa.com/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('spree_core', '>= 3.0.0')
  spec.add_dependency 'geoip', '~> 1.6.1'
  spec.add_runtime_dependency("impressionist", '~> 1.5.1')

  spec.add_development_dependency 'mysql2'
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
