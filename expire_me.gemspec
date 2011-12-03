# Run `rake expire_me.gemspec` to update the gemspec.
Gem::Specification.new do |s|
  # general infos
  s.name        = "expire_me"
  s.version     = "0.0.3"
  s.description = "control varnish expiration"
  s.homepage    = "http://github.com/colinyoung/expire_me"
  s.summary     = s.description

  # generated from git shortlog -sn
  s.authors = [
    "Colin Young"
  ]

  # generated from git shortlog -sne
  s.email = [
    "me@colinyoung.com"
  ]
  
  s.add_dependency 'activesupport', ['>= 2.3.9', '< 4']

  # generated from git ls-files
  s.files = [
    "License",
    "README.md",
    "Rakefile",
    "expire_me.gemspec",
    "lib/expire_me.rb",
    "lib/expire_me/adapter.rb",
    "lib/expire_me/adapters/varnish.rb",
    "lib/expire_me/expire.rb",
    "lib/expire_me/railtie.rb",
    "lib/expire_me/response.rb",
    "lib/expire_me/version.rb",
    "spec/expire_me_spec.rb",
    "test/test.rb",
    "test/test_helper.rb"
  ]

  # dependencies
  s.add_development_dependency "rspec", "~> 2.0"
end
