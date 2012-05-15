require 'spec_helper'

describe IContact::Response do
  let(:mock_raw_resp) do
    mock_resp = mock.tap do |m|
      m.stubs(:body).returns('{"errors":["Resource Or Version Not Implemented"]}')
    end
  end

  let(:response) { IContact::Response.new(mock_raw_resp) }

  it 'finds errors when present' do
    response.errors.should eql(JSON.parse(mock_raw_resp.body)["errors"])
  end

  it 'is invalid when errors are present' do
    response.stubs(:errors).returns(['something is wonky'])
    response.should_not be_valid
  end

  it 'is valid when errors are present' do
    response.stubs(:errors).returns([])
    response.should be_valid
  end
end

