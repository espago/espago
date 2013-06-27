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

    Error = Class.new(StandardError)
    AuthenticationError = Class.new(StandardError)

    def initialize(enviroment)
      @connection = Faraday.new(enviroment)
      @router = Router
    end

    def create(path, method, params = {} )
      route = @router.new(path, method).route
      response = route.new(@connection).request(params)

      handle_response response
    end

    private

    def handle_response(response)
      case response.status
      when 200,201
        return parse(response.body)
      when 202,204
        return true
      when 400
        raise Error, { error_message: 'bad request', status: 400 }
      when 401
        raise AuthenticationError, { error_message: 'not authenticated', status: 401 }
      when 404
        raise Error, { error_message: 'not found', status: 404 } 
      when 407
        raise Error, { error_message: 'proxy authentication required', status: 407 } 
      else
        raise Error, { error_message: 'unknown error', status: response.status }
      end
    end

    def parse(body)
      JSON.parse body
    end
  end
end
