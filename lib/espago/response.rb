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

    def method_missing(attribute_name)
      body[attribute_name.to_s]
    end

    def card
      body["card"] || {}
    end

    def created_at
      Time.at(body["created_at"]) rescue nil
    end

    private

    def parse(body)
      JSON.parse body
      rescue
        body
    end
  end
end

