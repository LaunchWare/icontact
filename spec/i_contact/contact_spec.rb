require 'spec_helper'

describe IContact::Contact do
  let(:email) { "user@example.com" }

  has_attr :contact_id, Integer
  has_attr :email, String
  has_attr :first_name, String
  has_attr :last_name, String
  has_attr :suffix, String
  has_attr :street, String
  has_attr :street2, String
  has_attr :city, String
  has_attr :state, String
  has_attr :postalCode, String
  has_attr :phone, String
  has_attr :fax, String
  has_attr :business, String

  use_vcr_cassette

  it 'allows me to create a contact' do
    contact = IContact::Contact.new(:email => email)
    contact.save.should be_true
  end

  it 'allows me to get all the contacts that are unlisted' do
    contacts = IContact::Contact.unlisted
    contacts.should_not be_empty
  end

  it 'destroys a contact' do
    contact = IContact::Contact.unlisted(:email => email).first
    if contact.nil?
      contact = IContact::Contact.new(:email => email).save!
    end
    lambda { contact.destroy }.should_not raise_error
  end
end

