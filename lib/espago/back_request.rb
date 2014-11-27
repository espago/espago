require "json"
require "time"

module Espago
  class BackRequest
    attr_reader :params

    def initialize(params)
      @params = parse(params)
    end

    def method_missing(attribute_name)
      params[attribute_name.to_s]
    end

    def card
      params["card"] || {}
    end

    def created_at
      Time.at(params["created_at"].to_i) rescue nil
    end

    private

    def parse(params)
      JSON.parse params
      rescue
        params
    end
  end
end

