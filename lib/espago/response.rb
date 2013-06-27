require "json"
require "time"

module Espago
  class Response
    attr_reader :status
    attr_reader :body

    def initialize(response)
      @body = parse(response.body)
      @status = response.status
    end

    def id
      body["id"]
    end

    def description
      body["description"]
    end

    def amount
      body["amount"]
    end

    def currency
      body["currency"]
    end

    def state
      body["state"]
    end

    def client
      body["client"]
    end

    def card
      body["card"] || {}
    end

    def created_at
      Time.parse body["created_at"]
    end

    private

    def parse(body)
      JSON.parse body
      rescue
        body
    end
  end
end

