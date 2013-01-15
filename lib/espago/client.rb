module Espago
  class Client
    attr_reader :public_key, :app_id
    NoApiKey = Class.new(StandardError)

    def initialize(options = {})
      @public_key = options[:pub_key] || Options.public_key
      @app_id = options[:app_id] || Options.app_id
      @request = options[:request] || ApiRequest.new
      validate!
    end

    def send_request(method, params)
      @request.create(method, params)
    end

    private
    def validate!
      raise NoApiKey unless @public_key || @app_id
    end
  end
end
