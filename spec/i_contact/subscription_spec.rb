require 'spec_helper'

describe IContact::Subscription do
  let(:email) { "subscriber@example.com" }

  use_vcr_cassette

  let(:contact) do
    c = IContact::Contact.new(:email => email)
    c.save
    c
  end

  let(:list) do
    l = IContact::List.new(:name => "Test Subscription List")
    l.save
    l
  end

  after(:each) do
    contact.destroy
    list.destroy
  end

  it 'allows me to add a list subscription for a given contact' do
    sub = IContact::Subscription.new({
      :contact_id => contact.contact_id,
      :list_id => list.list_id
    });

    sub.save.should be_true
  end
end

