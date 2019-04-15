require "espago/api_connection"
require "espago/response"

module Espago
  class Client
    attr_accessor :public_key, :app_id, :app_password, :api_version, :production, :checksum_key
    NotAuthenticated = Class.new(StandardError)

    def initialize(options = {})
      @public_key, @app_id, @app_password, @api_version, @checksum_key = options.values_at( :public_key, :app_id, :app_password, :api_version, :checksum_key)
      @connection = options[:connection] || ApiConnection
    end

    def send_request(path, method, params = {})

      app_id = params[:app_id].present? ?  params.delete(:app_id) : @app_id
      app_password = params[:app_password].present? ? params.delete(:app_password) : @app_password
      production_param = !params[:production].nil? ? params.delete(:production) : production

      raise NotAuthenticated unless valid?(app_id, app_password)

      connection = @connection.new(enviroment(production_param),api_version_header)
      connection.authenticate(app_id, app_password)
      connection.create(path, method, params)
    end

    def parse_response(request)
      Response.new(request)
    end

    private
    def enviroment(production_param)
      production_param ? "https://secure.espago.com/api" : "https://sandbox.espago.com/api"
    end

    def api_version_header
      if @api_version.to_f.to_s == '3.0'
        {'Accept' => "application/vnd.espago.v3+json"}
      else
        {'Accept' => "application/vnd.espago.v2+json"}
      end
    end

    def valid?(app_id, app_password)
      app_id && app_password
    end
  end
end
