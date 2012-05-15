require 'vcr'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.filter_sensitive_data('<APP_ID>') { IContact.configuration.app_id }
  c.filter_sensitive_data('<USER_NAME>') { IContact.configuration.user_name }
  c.filter_sensitive_data('<PASSWORD>') { IContact.configuration.password }
  c.configure_rspec_metadata!

  c.default_cassette_options = {
    :record => :new_episodes
  }
end

