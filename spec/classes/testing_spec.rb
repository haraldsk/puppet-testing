require 'spec_helper'

# http://rspec-puppet.com/tutorial/

describe 'testing', :type => 'class' do

  it { include_class('testing::params') }
  it { contain_file('/etc/testing/conf.d/some_option.conf') }

end
