module IContact
  class Configuration
    attr_accessor :api_key
    attr_accessor :user_name
    attr_accessor :password
    attr_accessor :api_version
    attr_accessor :mode

    def initialize(&block)
      yield(self) if block_given?
      @mode ||= :sandbox
      @api_version || '2.2'
    end
  end
end

