require 'spec_helper'

describe IContact do
  let(:app_id) { "app_id" }

  before(:each) do
    @config = IContact.configuration
  end

  after(:each) do
    IContact.configuration = @config
  end

  it 'instantiates a configuration' do
    IContact.configure do |config|
      config.app_id = app_id
    end

    IContact.configuration.should be_kind_of(IContact::Configuration)
    IContact.configuration.app_id.should eql(app_id)
  end

  it 'raises an exception if I do not have a valid configuration' do
    IContact.configuration = mock
    IContact.configuration.expects(:valid?).returns(false)
    lambda { IContact.connection }.should raise_error(IContact::InvalidConfiguration)
  end

  it 'raises an exception if I do not specify a configuration' do
    IContact.configuration = nil
    lambda { IContact.connection }.should raise_error(IContact::InvalidConfiguration)

  end

  it 'includes the account id in the url by default' do
    IContact.url.should =~ /#{IContact.configuration.account_id}/
  end

end

