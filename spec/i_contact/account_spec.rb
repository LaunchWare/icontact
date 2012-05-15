require 'spec_helper'

describe IContact::Account do
  use_vcr_cassette

  it 'allows me to fetch my account details' do
    account = IContact::Account.get.first
    account.account_id.should_not be_nil
  end
end

