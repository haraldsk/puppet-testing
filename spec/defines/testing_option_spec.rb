require 'spec_helper'

describe 'testing::option', :type => 'define' do
  let(:title)  { 'some_option' }

  context 'testing::option{some_option: value => true }' do
    let(:params) { { :value => true } }

    it do
      should contain_file("/etc/testing/conf.d/#{title}.conf") \
      .with( { 'ensure' => 'present' } ) \
      .with_content(/^\s*#{title}\s*=\s*#{params[:value]}\s*$/)
    end
  end
  context 'testing::option{some_option: ensure => absent }' do
    let(:params) { { :ensure => 'absent' } }
    it do
      should contain_file("/etc/testing/conf.d/#{title}.conf") \
      .with( { 'ensure' => 'absent' } ) \
    end
  end
  context 'testing::option{some_option: value => false }' do
    let(:params) { { :value => false } }
    it do
      should contain_file("/etc/testing/conf.d/#{title}.conf") \
      .with( { 'ensure' => 'absent' } ) \
    end
  end
end
