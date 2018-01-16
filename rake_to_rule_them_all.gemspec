Gem::Specification.new do |spec|
  spec.name          = "rake_to_rule_them_all"
  spec.version       = "0.1.0"
  spec.authors       = ["Jason Karns"]
  spec.email         = ["jason@karns.name"]

  spec.summary       = %q{Run Scripts-to-Rule-Them-All scripts as Rake tasks}
  spec.description   = %q{Generates a rake task for each Scripts-to-Rule-Them-All, so you can use rake as the runner.}
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*.rb']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
