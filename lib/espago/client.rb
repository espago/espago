require "espago/api_connection"
require "espago/response"

module Espago
  class Client
    attr_accessor :public_key, :app_id, :app_password, :api_version, :production
    NotAuthenticated = Class.new(StandardError)

    def initialize(options = {})
      @public_key, @app_id, @app_password, @api_version = options.values_at( :public_key, :app_id, :app_password, :api_version)
      @connection = options[:connection] || ApiConnection
    end

    def send_request(path, method, params = {})
      raise NotAuthenticated unless valid?
      connection = @connection.new(enviroment,api_version_header)
      connection.authenticate(@app_id, @app_password)
      connection.create(path, method, params)
    end

    def parse_response(request)
      Response.new(request)
    end

    private
    def enviroment
      production ? "https://secure.espago.com/api" : "https://edge.espago.com/api"
    end

    def api_version_header
      if @api_version == 3
        {'Accept' => "application/vnd.espago.v3+json"}
      else
        {'Accept' => "application/vnd.espago.v2+json"}
      end
    end


    def valid?
      @app_id && @app_password
    end
  end
end
