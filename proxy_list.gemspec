# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'proxy_list/version'

Gem::Specification.new do |spec|
  spec.name          = "proxy_list"
  spec.version       = ProxyList::VERSION
  spec.authors       = ["Francis Chong"]
  spec.email         = ["francis@ignition.hk"]
  spec.description   = %q{Gather list of proxies from various sources, validate them and rotate them for use.}
  spec.summary       = %q{Gather list of proxies from various sources, validate them and rotate them for use.}
  spec.homepage      = "https://github.com/siuying/proxy_list"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"
  spec.add_dependency "httparty"
  spec.add_dependency "thread"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rake"
end
