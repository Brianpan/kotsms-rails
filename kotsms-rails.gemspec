# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kotsms/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "kotsms-rails"
  spec.version       = Kotsms::Rails::VERSION
  spec.authors       = ["Brian Pan"]
  spec.email         = ["b97705021@ntu.edu.tw"]

  spec.summary       = %q{This is a api interface for kotsms service}
  spec.description   = %q{This is a api interface for kotsms service for sending sms message directly.}
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  ##dependency 的gem 放在這裡
  spec.add_development_dependency "rails", "~> 4.2"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rest-client", "~>1.8"
end
