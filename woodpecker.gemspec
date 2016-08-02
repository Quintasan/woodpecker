# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'woodpecker/version'

Gem::Specification.new do |spec|
  spec.name          = 'woodpecker'
  spec.version       = Woodpecker::Version
  spec.authors       = ['Michał Zając']
  spec.summary       = 'Simple Woodpecker API client'
  spec.description   = 'Simple API client for Woodpecker. Woodpecker is a service to send personalized cold emails & follow-ups to your users. '
  spec.homepage      = 'https://github.com/Quintasan/woodpecker'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'typhoeus', '~> 1.1.0'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'minitest-reporters', '~> 1.1.11'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rubocop', '~> 0.42.0'
end
