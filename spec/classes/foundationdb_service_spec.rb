require 'spec_helper'


describe 'foundationdb::service' do
  let(:node) { 'test.example.com' }
  let :params do { 
    :service_ensure         => 'running',
  } end

  it { is_expected.to compile.with_all_deps }

  it { is_expected.to contain_service('foundationdb').with(
    :ensure     => 'running',
  )}

end
