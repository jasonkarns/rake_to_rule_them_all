Gem::Specification.new do |spec|
  spec.name          = "rake_to_rule_them_all"
  spec.version       = "0.1.0"
  spec.authors       = ["Jason Karns"]
  spec.email         = ["jason@karns.name"]

  spec.summary       = %q{Generates rake tasks for each Scripts to Rule Them All}
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
