# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sass_inline_svg/version'

Gem::Specification.new do |spec|
  spec.name          = "sass_inline_svg"
  spec.version       = SassInlineSvg::VERSION
  spec.authors       = ["Franz Heidl"]
  spec.email         = ["franz@franzheidl.de"]
  spec.summary       = %q{Inline url-encoded SVG with Sass}
  spec.description   = %q{Inline url-encoded SVG with Sass. Optional variable string replacement included!}
  spec.homepage      = "https://github.com/franzheidl/sass-inline-svg"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
