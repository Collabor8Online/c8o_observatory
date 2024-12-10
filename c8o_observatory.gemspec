# frozen_string_literal: true

require_relative "lib/observatory/version"

Gem::Specification.new do |spec|
  spec.name = "c8o_observatory"
  spec.version = Observatory::VERSION
  spec.authors = ["Rahoul Baruah"]
  spec.email = ["baz@collabor8online.co.uk"]

  spec.summary = "A simple observatory for your Ruby code."
  spec.description = "A simpe observatory for your Ruby code."
  spec.homepage = "https://www.collabor8online.co.uk"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/collabor8online/c8o_observatory"
  spec.metadata["changelog_uri"] = "https://github.com/collabor8online/c8o_observatory"

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "standard-procedure-plumbing", ">= 0.5.2"
end
