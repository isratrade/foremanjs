# foreman plugins import this file therefore __FILE__ cannot be used
FOREMAN_GEMFILE = __FILE__ unless defined? FOREMAN_GEMFILE
require File.expand_path('../config/settings', FOREMAN_GEMFILE)
require File.expand_path('../lib/regexp_extensions', FOREMAN_GEMFILE)

source 'https://rubygems.org'

gem 'rails', '3.2.20'
gem 'json'
gem 'rest-client', '> 1.6.2', '< 1.7', :require => 'rest_client'
gem "audited-activerecord", "3.0.0"
gem "will_paginate", "~> 3.0.2"
gem "ancestry", "~> 2.0.0"
gem 'scoped_search', '>= 2.7.0', '< 3.0.0'
gem 'net-ldap'
gem 'ldap_fluff', '>= 0.3.0', '< 1.0.0'
gem 'uuidtools'
gem "apipie-rails", "~> 0.2.5"
gem 'rabl', '>= 0.7.5', '<= 0.9.0'
gem 'oauth'
gem 'deep_cloneable', '~> 2.0'
gem 'foreigner', '~> 1.4.2'
gem 'validates_lengths_from_database',  '~> 0.2.0'
gem 'friendly_id', '~> 4.0'
gem 'secure_headers', '~> 1.3.3'

#gem 'katello', :git => 'git@github.com:isratrade/katello.git'
#gem 'katello', :path => '../katello'

# Newer version of safemode contains fixes for Ruby 1.9
gem 'safemode', '~> 1.2.1'
gem 'ruby_parser', '~> 3.0.0'

Dir["#{File.dirname(FOREMAN_GEMFILE)}/bundler.d/*.rb"].each do |bundle|
  self.instance_eval(Bundler.read_file(bundle))
end
