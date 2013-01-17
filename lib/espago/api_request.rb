require "faraday"
require "active_support/inflector"
require "json"

module Espago
  class ApiRequest
    NoPathError = Class.new(StandardError)

    #factory pattern
    class GetClients
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.get('clients')
      end
    end

    def initialize
      @connection = Faraday.new("https://edge.espago.com/api")
      @connection.basic_auth('908112077', '12PrOsTe34')
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
