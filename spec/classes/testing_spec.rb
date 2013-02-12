require 'spec_helper'

# http://rspec-puppet.com/tutorial/
# https://github.com/rodjek/rspec-puppet/blob/master/README.md

describe 'testing', :type => 'class' do
  let(:facts) { {:osfamily => 'Debian' } }

  it do
    should include_class('testing::params')
  end

  context '$::osfamily = Debian' do
    let(:facts) { {:osfamily => 'Debian' } }
    it do
      should contain_package('testing-tools')
    end
  end

  context '$::osfamily = RedHat' do
    let(:facts) { {:osfamily => 'RedHat' } }
    it do
      should contain_package('testing-suite')
    end
  end

  context '$::osfamily = Windows' do
    let(:facts) { {:osfamily => 'Windows' } }
    it do
       expect {
        should contain_service('testing_service')
       }.to raise_error(Puppet::Error, /Osfamily:\s*Windows/ )
    end
  end

  context '$::osfamily = undef' do
    let(:facts) { {  } }
    it do
       expect {
        should contain_service('testing_service')
       }.to raise_error(Puppet::Error, /Osfamily/ )
    end
  end

  context 'include testing' do
    it do
      should contain_service('testing_service').with( {
        'ensure'  => 'running',
        'enable'  => 'true',
      } )
    end
  end

  context 'class { testing: service_ensure => foo }' do
    let(:params) { {:service_ensure => 'foo' } }
    it do
       expect {
        should contain_service('testing_service')
       }.to raise_error(Puppet::Error, /validate_re.*foo/ )
    end
  end

  context 'class { testing: service_enabled => false }' do
    let(:params) { {:service_enable => 'false' } }
    it do
      should contain_service('testing_service').with( {
        'enable' => 'false'
      } )
    end
  end

end
