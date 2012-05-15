module IContact
  class Configuration
    attr_accessor :app_id
    attr_accessor :user_name
    attr_accessor :password
    attr_accessor :api_version
    attr_accessor :mode
    attr_accessor :account_id
    attr_accessor :client_folder_id

    REQUIRED_FIELDS = [
      :app_id,
      :user_name,
      :password,
    ]

    def initialize(&block)
      yield(self) if block_given?
      @mode ||= :sandbox
      @api_version || '2.2'
    end

    def valid?
      REQUIRED_FIELDS.each do |field|
        return false if send(field).nil? || send(field) == ''
      end
      true
    end
  end
end

