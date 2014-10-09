require 'spec_helper'


describe 'foundationdb' do
  let(:node) { 'test.example.com' }
  let(:params) { { :package_source => 'http://foundationdb.com' } }

  it { is_expected.to compile.with_all_deps }
  it { is_expected.to contain_class('foundationdb::package') }
  it { is_expected.to contain_class('foundationdb::config').that_requires('Class[foundationdb::package]') }

end
