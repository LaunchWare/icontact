module IContact
  class Response
    attr_reader :errors
    attr_reader :warnings
    attr_reader :parsed_response

    def initialize(resp)
      @parsed_response = JSON.parse(resp.body)
      if resp.status != 200
        @errors = ["Server responded with a #{resp.status}: #{resp.body}"]
      else
        @errors = @parsed_response['errors'] || []
        @warnings = @parsed_response['warnings'] || []
      end
    end

    def valid?
      errors.size == 0
    end
  end
end

