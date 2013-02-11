require 'spec_helper'

describe 'testing::option', :type => 'define' do
  let(:title)  { 'some_option' }
  let(:value)  { 'true'  } # h4x
  let(:params) { { :value => value } }

  it do
    should contain_file("/etc/testing/conf.d/#{title}.conf") \
    .with( { 'ensure' => 'present' } ) \
    .with_content(/^\s*#{title}\s*=\s*#{value}\s*$/)
  end
  context 'ensure => absent' do
    let(:params) { { :ensure => 'absent' } }
    it do
      should contain_file("/etc/testing/conf.d/#{title}.conf") \
      .with( { 'ensure' => 'absent' } ) \
    end
  end
  context 'value => false' do
    let(:params) { { :value => false } }
    it do
      should contain_file("/etc/testing/conf.d/#{title}.conf") \
      .with( { 'ensure' => 'absent' } ) \
    end
  end
end
