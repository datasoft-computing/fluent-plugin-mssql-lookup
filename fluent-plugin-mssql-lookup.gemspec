lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name    = "fluent-plugin-mssql-lookup"
  spec.version = "0.1.0"
  spec.authors = ["Alastair Hails"]
  spec.email   = ["alastairhails@datasoftcomputing.com"]

  spec.summary       = "FluentD filter plugin for resolving additional fields via a database lookup"
  spec.description   = "FluentD filter plugin for resolving additional fields via a database lookup"
  spec.homepage      = "https://github.com/datasoft-computing/fluent-plugin-mssql-lookup"
  spec.license       = "Apache-2.0"

  test_files, files  = `git ls-files -z`.split("\x0").partition do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.files         = files
  spec.executables   = files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = test_files
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "test-unit", "~> 3.0"
  spec.add_runtime_dependency "fluentd", [">= 0.14.10", "< 2"]
end
