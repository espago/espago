require "espago/api_connection"

module Espago
  class Client
    attr_accessor :public_key, :app_id, :app_password
    NotAuthenticated = Class.new(StandardError)

    def initialize(options = {})
      @public_key, @app_id, @app_password = options.values_at( :public_key, :app_id, :app_password)
      @connection = options[:connection] || ApiConnection.new
    end

    def send_request(path, method, params = {})
      raise NotAuthenticated unless valid?
      @connection.authenticate(@app_id, @app_password)
      @connection.create(path, method, params)
    end

    private

    def valid?
      @app_id && @app_password
    end
  end
end
