# -*- encoding: utf-8 -*-
# stub: factory_girl 4.9.0 ruby lib

Gem::Specification.new do |s|
  s.name = "factory_girl".freeze
  s.version = "4.9.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Josh Clayton".freeze, "Joe Ferris".freeze]
  s.date = "2017-10-23"
  s.description = "factory_girl provides a framework and DSL for defining and\n                      using factories - less error-prone, more explicit, and\n                      all-around easier to work with than fixtures.".freeze
  s.email = ["jclayton@thoughtbot.com".freeze, "jferris@thoughtbot.com".freeze]
  s.homepage = "https://github.com/thoughtbot/factory_girl".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2".freeze)
  s.rubygems_version = "3.4.15".freeze
  s.summary = "factory_girl provides a framework and DSL for defining and using model instance factories.".freeze

  s.installed_by_version = "3.4.15" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<activesupport>.freeze, [">= 3.0.0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
  s.add_development_dependency(%q<rspec-its>.freeze, ["~> 1.0"])
  s.add_development_dependency(%q<cucumber>.freeze, ["~> 1.3.15"])
  s.add_development_dependency(%q<timecop>.freeze, [">= 0"])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  s.add_development_dependency(%q<aruba>.freeze, [">= 0"])
  s.add_development_dependency(%q<appraisal>.freeze, ["~> 2.1.0"])
  s.add_development_dependency(%q<activerecord>.freeze, [">= 3.0.0"])
  s.add_development_dependency(%q<yard>.freeze, [">= 0"])
end
