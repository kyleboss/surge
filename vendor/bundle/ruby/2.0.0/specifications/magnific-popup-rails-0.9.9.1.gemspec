# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "magnific-popup-rails"
  s.version = "0.9.9.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joshua Jansen"]
  s.date = "2014-12-09"
  s.description = "Magnific Popup is a free responsive jQuery lightbox plugin that is focused on performance and providing best experience for user with any device"
  s.email = ["joshua@itflows.nl"]
  s.homepage = "https://github.com/joshuajansen/magnific-popup-rails"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Magnific Popup displays images before they're completely loaded to take full advantage of progressive loading. For in and out transitions CSS3 is used instead of slow JavaScript animation."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
