require 'spec_helper'

describe IContact::Model do
  class TestModel
    include IContact::Model

    key_attribute :test_model_id
    attribute :email, :type => String
  end

  let(:email) { 'user@example.com' }
  let(:model) { TestModel.new(:email => email) }


  it 'has a getter and setter for a declared model' do
    new_email = 'another_user@example.com'
    model.email.should eql(email)
    model.email = new_email
    model.email.should eql(new_email)
  end

  it 'defaults to a resource name a demodulized version of the class name' do
    model.class.resource_name.should eql('testmodel')
  end

  it 'uses the IContact http connection' do
    TestModel.connection.should eql(IContact.connection)
  end

  it 'is persisted if the key attribute is populated' do
    model.test_model_id = 1234
    model.should be_persisted

    model.test_model_id = nil
    model.attributes = { :test_model_id => 1234 }
    model.test_model_id.should_not be_nil
  end

  it 'appropriately parses json when an array is specified' do
    mock_resp = mock
    mock_resp.stubs(:valid?).returns(false)
    mock_resp.stubs(:body).returns({:testmodels => [{:email => email}]}.to_json)
    result = model.class.parse(mock_resp)
    result.size.should eql(1)
    result.first.email.should eql(email)
  end
end

