require 'spec_helper'


describe 'foundationdb::package' do
  let(:node) { 'test.example.com' }
  let(:params) { { :package_source => 'http://foundationdb.com' } }

  it { is_expected.to compile.with_all_deps }
  it { is_expected.to contain_class('foundationdb::package::redhat') }

end
