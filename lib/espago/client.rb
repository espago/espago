require "espago/api_request"

module Espago
  class Client
    attr_accessor :public_key, :app_id, :app_password
    NoApiKey = Class.new(StandardError)

    def initialize(options = {})
      @public_key, @app_id, @app_password = options.values_at( :public_key, :app_id, :app_password)
      @request = options[:request] || ApiRequest.new
      validate!
    end

    def send_request(path, method, params = {})
      @request.create(path, method, params)
    end

    private
    def validate!
      raise NoApiKey unless @public_key && @app_id && @app_password
    end
  end
end


# client = Espago::Client.new
# response = client.send_request(:clients, :get)
# binding.pry
