require "espago/api_connection"
require "espago/response"

module Espago
  class Client
    attr_accessor :public_key, :app_id, :app_password, :production
    NotAuthenticated = Class.new(StandardError)

    def initialize(options = {})
      @public_key, @app_id, @app_password = options.values_at( :public_key, :app_id, :app_password)
      @connection = options[:connection] || ApiConnection
    end

    def send_request(path, method, params = {})
      raise NotAuthenticated unless valid?
      connection = @connection.new(enviroment)
      connection.authenticate(@app_id, @app_password)
      connection.create(path, method, params)
    end

    def parse_response(request)
      Response.new(request)
    end

    private
    def enviroment
      production ? "https://secure.espago.com/api" : "https://sandbox.espago.com/api"
    end

    def valid?
      @app_id && @app_password
    end
  end
end
