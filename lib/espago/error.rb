module Espago
  class Error < StandardError
    attr_reader :status
    attr_reader :body

    def initialize(response)
      @status = response.status
      @body   = response.body
    end
  end
end
