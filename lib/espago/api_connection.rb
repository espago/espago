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

    def initialize
      @connection = Faraday.new("https://edge.espago.com/api")
      @router = Router
    end

    def create(path, method, params = {} )
      router = @router.path_to(path, method)
      response = router.new(@connection).request(params)
      parse response.body
    end

    private
    def parse(body)
      JSON.parse body
    end
  end
end
