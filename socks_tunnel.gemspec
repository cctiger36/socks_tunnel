# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'socks_tunnel/version'

Gem::Specification.new do |spec|
  spec.name          = "socks_tunnel"
  spec.version       = SocksTunnel::VERSION
  spec.authors       = ["Weihu Chen"]
  spec.email         = ["cctiger36@gmail.com"]

  spec.summary       = %q{Establish secure tunnel via Socks 5.}
  spec.description   = %q{Establish secure tunnel via Socks 5. Dependents on EventMachine and ruby Fiber.}
  spec.homepage      = "https://github.com/cctiger36/socks_tunnel"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "eventmachine", "~> 1.2"
  spec.add_dependency "thor", ">= 0.19", "< 0.21"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec", "~> 3.8"
end
