require 'faraday'
require 'i_contact/version'
require 'i_contact/configuration'
require 'i_contact/contact'

module IContact
  class InvalidConfiguration < Exception; end;

  class << self
    def configure(&block)
      @configuration = IContact::Configuration.new(&block) if block_given?
    end

    def configuration
      @configuration
    end

    def configuration=(configuration)
      @configuration = configuration
    end

    def connection
      if configuration.nil? || !configuration.valid?
        raise InvalidConfiguration
      end

      @connection ||= Faraday::Connection.new(:url => url,
        :headers => headers,
        :ssl => {:verify => true}) do |builder|

        builder.adapter Faraday.default_adapter
        builder.use Faraday::Response::ParseJson
        builder.use Faraday::Response::Mashify
      end
    end

    def reset_connection!
      @connection = nil
      connection
    end

    protected
    def url
      if configuration.mode == :sandbox
        'https://app.sandbox.icontact.com/icp/'
      else
        'https://app.icontact.com/icp/'
      end
    end

    def headers
      {
        'API-AppId' => configuration.app_id,
        'API-UserName' => configuration.user_name,
        'API-Password' => configuration.password
      }
    end
  end
end

