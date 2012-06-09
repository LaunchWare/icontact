require 'faraday'
require 'faraday_middleware/response/parse_json'
require 'faraday/request/url_encoded'

require 'active_attr'

require 'i_contact/version'
require 'i_contact/configuration'
require 'i_contact/response'

require 'i_contact/model'

require 'i_contact/account'
require 'i_contact/client_folder'

require 'i_contact/contact'
require 'i_contact/list'
require 'i_contact/subscription'

module IContact
  class InvalidConfiguration < Exception; end;
  class ApiError < Exception; end;
  class InvalidResource < Exception; end;

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

      @connection ||= Faraday::Connection.new({
        :headers => headers,
        :ssl => {:verify => true}}) do |builder|

        #builder.use Faraday::Request::UrlEncoded
        builder.adapter Faraday.default_adapter
      end
    end

    def reset_connection!
      @connection = nil
      connection
    end

    def url(with_account_and_folder = true)
      base_url = "https://#{host}/icp/"
      if with_account_and_folder
        base_url += "a/#{configuration.account_id}/c/#{configuration.client_folder_id}/"
      end
      base_url

    end

    protected
    def host
      if configuration.mode == :sandbox
        'app.sandbox.icontact.com'
      else
        "app.icontact.com"
      end
    end

    def headers
      {
        'API-AppId' => configuration.app_id,
        'API-UserName' => configuration.user_name,
        'API-Password' => configuration.password,
        'API-Version'  => '2.2',
        'Accept'       => 'application/json',
        'Content-Type' => 'application/json'
      }
    end
  end
end

