# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "social_security_number/version"

Gem::Specification.new do |spec|
  spec.name          = "social_security_number"
  spec.version       = SocialSecurityNumber::VERSION
  spec.authors       = ["SameSystem"]
  spec.email         = ["devops@samesystem.com"]

  spec.summary       = %q{It provides validators for national identification numbers.}
  spec.description   = %q{It provides validators for national identification numbers. Currently the following countries are supported: Belgium, Canada, China, Czech Republic, Denmark, Estonia, Germany, Finland, France, Iceland, Ireland, Italy, Latvia, Lithuania, Mexico, Netherlands, Norway, Pakistan, Spain, Sweden, Switzerland, United Kingdom, United States }
  spec.homepage      = "https://github.com/samesystem/social_security_number"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
