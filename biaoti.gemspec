# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'biaoti/version'

Gem::Specification.new do |spec|
  spec.name          = "biaoti"
  spec.version       = Biaoti::VERSION
  spec.authors       = ["Adam Dawkins"]
  spec.email         = ["adamdawkins@gmail.com"]
  spec.description   = %q{Copies the title of a page to the clipboard}
  spec.summary       = %q{标题（Biāotí) means 'title' in Mandarin}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "nokogiri", "~> 1.6.0"
  spec.add_runtime_dependency "clipboard", "~> 1.0.5"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "turn"
end
