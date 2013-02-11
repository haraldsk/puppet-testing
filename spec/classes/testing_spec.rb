require 'spec_helper'

# http://rspec-puppet.com/tutorial/

describe 'testing', :type => 'class' do
  let(:facts) { {:osfamily => 'Darwin' } }

  it do
    should include_class('testing::params')
    should contain_file('/etc/testing/conf.d/some_option.conf').with( {
        'ensure' => 'absent'
    } )
    should contain_service('testing_service').with( {
      'ensure'  => 'running',
      'enable'  => 'true',
    } )
    should contain_package('testing-osx')
  end

  context 'Redhat' do
    let(:facts) { {:osfamily => 'RedHat' } }
    it do
      should contain_package('testing-suite')
    end
  end

  context 'Debian' do
    let(:facts) { {:osfamily => 'Debian' } }
    it do
      should contain_package('testing-tools')
    end
  end

  context 'Windows' do
    let(:facts) { {:osfamily => 'Windows' } }
    it do
       expect {
        should contain_file('/etc/testing/conf.d/some_option.conf')
       }.to raise_error(Puppet::Error)
    end
  end

  context 'service_ensure => foo' do
    let(:params) { {:service_ensure => 'foo' } }
    it do
       expect {
        should contain_file('/etc/testing/conf.d/some_option.conf')
       }.to raise_error(Puppet::Error)
    end

  end
  context 'some_option => true' do
    let(:params) { {:some_option => 'true' } }
    it do
      should contain_file('/etc/testing/conf.d/some_option.conf') \
        .with( { 'ensure' => 'present' } ) \
        .with_content(/^\s*some_option\s?=\s=?on\s*$/)
    end
  end

  context 'service_enabled => false' do
    let(:params) { {:service_enable => 'false' } }
    it do
      should contain_service('testing_service').with( {
        'enable' => 'false'
      } )
    end
  end

end
