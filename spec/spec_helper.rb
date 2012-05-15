require 'rspec'
require 'i_contact'
require 'mocha'

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :mocha
  config.extend VCR::RSpec::Macros
end

