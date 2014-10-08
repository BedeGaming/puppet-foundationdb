require 'spec_helper'


describe 'foundationdb' do
  let(:node) { 'test.example.com' }

  it {
    should contain_class('foundationdb::package')
  }

  it {
    should contain_class('foundationdb::config')
  }

  it {
    should contain_class('foundationdb::service')
  }

end
