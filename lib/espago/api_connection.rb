require "faraday"
require "active_support/inflector"
require "json"
require "forwardable"
require "espago/api_connection/get_clients"

module Espago
  class ApiConnection
    NoPathError = Class.new(StandardError)

    extend Forwardable

    def_delegator :@connection, :basic_auth, :authenticate

    #factory pattern
    def initialize
      @connection = Faraday.new("https://edge.espago.com/api")
    end

    def create(path, method, params = {} )
      class_name = get_class_name(path, method)

      #factory pattern
      begin
        klass = self.class.const_get(class_name)
        response = klass.new(@connection).request(params)
      rescue
        raise NoPathError
      end
      parse response.body
    end

    private

    def parse(body)
      JSON.parse body
    end

    def get_class_name(path, method)
      method.to_s.camelize + path.to_s.camelize
    end

  end
end
