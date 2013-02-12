require 'spec_helper'

describe 'testing', :type => 'class' do
  let(:facts) { {:osfamily => 'Debian' } }

  it do
    should include_class('testing::params')
  end

end
