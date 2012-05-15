module IContact
  class Response
    include ActiveAttr::BasicModel

    attr_reader :errors
    attr_reader :parsed_response

    def initialize(resp)
      @parsed_response = JSON.parse(resp.body)
      @errors = @parsed_response['errors'] || []
    end

    def valid?
      errors.size == 0
    end
  end
end

