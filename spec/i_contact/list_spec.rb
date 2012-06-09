require 'spec_helper'

describe IContact::List do
  use_vcr_cassette

  it 'can be created' do
    list = IContact::List.new(:name => "Test List")
    list.save.should be_true
    list.should be_persisted
    lambda { list.destroy }.should_not raise_error
  end
end

