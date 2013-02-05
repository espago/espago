require "faraday"
require "json"
require "forwardable"
require "espago/router"
require "facets/kernel/require_all"

require_all "api_connection/*"

module Espago
  class ApiConnection
    extend Forwardable
    def_delegator :@connection, :basic_auth, :authenticate

    def initialize(enviroment)
      @connection = Faraday.new(enviroment)
      @router = Router
    end

    def create(path, method, params = {} )
      route = @router.new(path, method).route
      response = route.new(@connection).request(params)
      parse response.body
    end

    private
    def parse(body)
      JSON.parse body
    end
  end
end
