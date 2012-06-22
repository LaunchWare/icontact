# -*- encoding: utf-8 -*-
require File.expand_path('../lib/i_contact/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Dan Pickett']
  gem.email         = ['dpickett@enlightsolutions.com']
  gem.description   = %q{web wrapper for icontact}
  gem.summary       = %q{web wrapper for icontact}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'i_contact'
  gem.require_paths = ['lib']
  gem.version       = IContact::VERSION

  gem.add_dependency 'faraday'
  gem.add_dependency 'faraday_middleware'
  gem.add_dependency 'multi_json'
  gem.add_dependency 'activesupport', '~> 2.3.5'
  gem.add_dependency 'activerecord', '~> 2.3.5'
  gem.add_dependency 'active_record_base_without_table'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'mocha'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'pry'
end

