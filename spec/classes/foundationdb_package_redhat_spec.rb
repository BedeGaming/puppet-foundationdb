require 'spec_helper'

describe 'foundationdb::package::redhat' do
  let(:node) { 'test.example.com' }
  let(:params) { { :package_source => 'http://foundationdb.com' } }

  it { is_expected.to compile.with_all_deps }
  it { is_expected.to contain_package('foundationdb-clients') }
  it { is_expected.to contain_package('foundationdb-server') }
  it { is_expected.to contain_file('/etc/yum.repos.d/foundationdb-release.repo') }

  it { is_expected.to contain_yumrepo('foundationdb-release').with(
    'descr'    => 'foundationdb repo',
    'enabled'  => '1',
    'gpgcheck' => '0',
    'priority' => '1',
  )}

end
