require 'spec_helper'


describe 'foundationdb' do
  let(:node) { 'test.example.com' }

  it {
    should contain_class('foundationdb::package')
    should contain_class('foundationdb::config')
    should contain_class('foundationdb::service')
  }

end
