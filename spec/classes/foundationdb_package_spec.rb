require 'spec_helper'


describe 'foundationdb::package' do
  let(:node) { 'test.example.com' }
  let(:osfamily) { 'RedHat' }
  let(:params) { { :package_source => 'http://foundationdb.com',
                   :package_name => 'foundationdb',
                   :manage_repo => true } }

  it { is_expected.to compile.with_all_deps }
  it { is_expected.to contain_class('foundationdb::package::redhat') }

end
