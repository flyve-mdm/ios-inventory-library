# -*- encoding: utf-8 -*-
# stub: fastlane-plugin-xcov_report 1.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "fastlane-plugin-xcov_report".freeze
  s.version = "1.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Gianfranco Manganiello".freeze]
  s.date = "2017-09-13"
  s.email = "gianfrancomanganiello1997@gmail.com".freeze
  s.homepage = "https://github.com/Gianfranco97/xcov-report".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Generate custom HTML for coverage".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<fastlane>.freeze, [">= 2.55.0"])
    else
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<fastlane>.freeze, [">= 2.55.0"])
    end
  else
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<fastlane>.freeze, [">= 2.55.0"])
  end
end
