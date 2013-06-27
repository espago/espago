module Espago
  class InvalidRequestError < Error
    def initialize(response)
      @status = response.status
      @body = parse(response.body)
    end

    private

    def parse(body)
      JSON.parse body
      rescue
        body
    end
  end
end
