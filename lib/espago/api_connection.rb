require "faraday"
require "json"
require "forwardable"
require "espago/router"
require "espago/error"
require "espago/response"

::Dir[::File.expand_path('error/*.rb', __dir__)].each { require _1 }
::Dir[::File.expand_path('api_connection/*.rb', __dir__)].each { require _1 }

module Espago
  class ApiConnection

    def initialize(enviroment,headers)
      @connection = Faraday.new(enviroment)
      @connection.headers = headers
      @router = Router
    end

    def create(path, method, params = {} )
      route = @router.new(path, method).route
      response = route.new(@connection).request(params)

      handle_response response
    end

    def authenticate(username, password)
      @connection.request(:authorization, :basic, username, password)
    end

    private

    def handle_response(response)
      case response.status
      when 200, 201, 204
        return Response.new(response)
      when 400, 404, 422
        raise invalid_request_error(response)
      when 401
        raise authentication_error(response)
      else
        raise api_error(response)
      end
    end

    def invalid_request_error(response)
      InvalidRequestError.new(response)
    end

    def authentication_error(response)
      AuthenticationError.new(response)
    end

    def api_error(response)
      ApiError.new(response)
    end

  end
end
