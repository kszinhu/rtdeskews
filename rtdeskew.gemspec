# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "rtdeskew/version"

Gem::Specification.new do |s|
  s.name        = "rtdeskew"
  s.version     = Rtdeskew::VERSION
  s.authors     = ["Cassiano Rodrigues"]
  s.email       = "kszinhu@kszinhu.dev.br"

  s.summary     = "Deskew images containing text"
  s.description = %q{Ruby library to deskew images containing text to boost OCR accuracy.}
  s.homepage    = "https://rubygems.org/gems/rtdeskew"
  s.license     = "MIT"

  s.files       = ["lib/**/*"]
  s.require_paths = ["lib"]

  s.add_runtime_dependency "json"
  s.add_runtime_dependency "mini_magick"

  s.add_development_dependency "bundler",                   "~> 2.4"
  s.add_development_dependency "pry-byebug",                "~> 3.6"
  s.add_development_dependency "rake",                      "~> 10.0"
  s.add_development_dependency "rspec",                     "~> 3.0"
  s.add_development_dependency "rubocop",                   "~> 1.64"
  s.add_development_dependency "rubocop-github",            "~> 0.17"
  s.add_development_dependency "rubocop-rspec",             "~> 2.0"
  s.add_development_dependency "simplecov",                 "~> 0.16"
  s.add_development_dependency "simplecov-console",         "~> 0.4"
end
