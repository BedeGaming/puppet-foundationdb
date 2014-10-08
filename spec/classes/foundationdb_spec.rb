require 'spec_helper'

describe 'foundationdb', :type => 'class' do

    it {
      should contain_class('foundationdb::package')
    }

end
