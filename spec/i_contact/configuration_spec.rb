require 'spec_helper'

describe IContact::Configuration do
  let(:api_key) { 'api_key' }
  let(:user_name) { 'user_name' }
  let(:password) { 'password' }

  let(:configuration) do
    IContact::Configuration.new do |config|
      config.api_key = api_key
      config.user_name = user_name
      config.password = password
    end
  end

  it 'has an api key' do
    configuration.api_key.should eql(api_key)
  end

  it 'has a user name' do
    configuration.user_name.should eql(user_name)
  end

  it 'has a password' do
    configuration.password.should eql(password)
  end

  it 'defaults the api version to 2.2' do
    configuration.api_version = '2.2'
  end

  it 'defaults to sandbox mode' do
    configuration.mode = :sandbox
  end
end

