require "faraday"
require "active_support/inflector"

module Espago
  class ApiRequest
    NoPathError = Class.new(StandardError)
    attr_reader :cone

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
      @connection = Faraday.new("https://edge.espago.com/api") do |conn|
        conn.basic_auth('908112077', 'TaJnEhAsLo123')
      end
    end

    def create(path, method, params = {} )
      class_name = get_class_name(path, method)

      #factory pattern
      begin
        klass = self.class.const_get(class_name)
        response = klass.new(@connection).request(params)
        response.body
      rescue
        raise NoPathError
      end
    end

    private

    def get_class_name(path, method)
      method.to_s.camelize + path.to_s.camelize
    end

  end
end

# Espago::ApiRequest.new.create(:clients, :get )
