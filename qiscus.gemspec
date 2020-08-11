Gem::Specification.new do |spec|
  spec.name = "qiscus"
  spec.version = "0.0.1"

  spec.authors       = ["Tristanto"]
  spec.email         = ["tristanto.kurniawan@gmail.com"]
  spec.homepage      = "https://github.com/rustyworks/qiscus/"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.summary = %q{Wrapper for Qiscus API}
  spec.description   = %q{Wrapper for the Qiscus API}
  spec.license       = "MIT"

  spec.add_runtime_dependency 'httparty'
end
