require 'spec_helper'

describe IContact do
  let(:api_key) { "api_key" }

  before(:each) do
    @config = IContact.configuration
  end

  after(:each) do
    IContact.configuration = @config
  end

  it 'instantiates a configuration' do
    IContact.configure do |config|
      config.api_key = api_key
    end

    IContact.configuration.should be_kind_of(IContact::Configuration)
    IContact.configuration.api_key.should eql(api_key)
  end
end

