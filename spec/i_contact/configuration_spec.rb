require 'spec_helper'

describe IContact::Configuration do
  let(:app_id) { 'app_id' }
  let(:user_name) { 'user_name' }
  let(:password) { 'password' }
  let(:account_id) { 'account_id' }
  let(:client_folder_id) { 'client_folder_id' }

  let(:configuration) do
    IContact::Configuration.new do |config|
      config.app_id = app_id
      config.user_name = user_name
      config.password = password
      config.account_id = account_id
      config.client_folder_id = client_folder_id
    end
  end

  it 'has an api key' do
    configuration.app_id.should eql(app_id)
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

  describe 'validity' do
    it 'is invalid if I do not specify an app_id' do
      configuration.app_id = nil
      configuration.should_not be_valid
    end

    it 'is invalid if I do not specify a user_name' do
      configuration.user_name = nil
      configuration.should_not be_valid
    end

    it 'is invalid if I do not specify a password' do
      configuration.password = nil
      configuration.should_not be_valid
    end

    it 'is invalid if I do not specify an account id' do
      configuration.account_id = nil
      configuration.should_not be_valid
    end

    it 'is invalid if I do not specify a client folder id' do
      configuration.client_folder_id = nil
      configuration.should_not be_valid
    end
  end
end

