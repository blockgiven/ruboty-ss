# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/ss/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-ss"
  spec.version       = Ruboty::Ss::VERSION
  spec.authors       = ["block_given?"]
  spec.email         = ["block_given@outlook.com"]
  spec.summary       = %q{ruboty plugin for take a screenshot of website.}
  spec.homepage      = "https://github.com/blockgiven/ruboty-ss/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "dropbox-sdk"
  spec.add_runtime_dependency "jsonism"
  spec.add_runtime_dependency "mem"
  spec.add_runtime_dependency "ruboty"
  spec.add_runtime_dependency "phantomjs"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "jdoc"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
end
