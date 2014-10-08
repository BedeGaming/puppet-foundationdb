source 'https://rubygems.org'

if ENV.key?('PUPPET_VERSION')
  puppetversion = "= #{ENV['PUPPET_VERSION']}"
else
  puppetversion = ['>= 3.4']
end

gem 'rake'
gem 'puppet-lint'
gem 'rspec-puppet', :git => 'git@github.com:rodjek/rspec-puppet.git'
gem 'puppetlabs_spec_helper'
gem 'puppet', puppetversion
