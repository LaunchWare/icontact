require 'spec_helper'

describe IContact::ClientFolder do
  use_vcr_cassette

  it 'returns a valid contact folder' do
    folder = IContact::ClientFolder.get.first
    folder.client_folder_id.to_s.should eql(IContact.configuration.client_folder_id)
  end
end
