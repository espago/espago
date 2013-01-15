module Espago
  class Client
    attr_reader :public_key, :app_id
    NoApiKey = Class.new(StandardError)

    def initialize(options = {})
      @public_key = options[:pub_key] || Options.public_key
      @app_id = options[:app_id] || Options.app_id
      validate!
    end

    private
    def validate!
      raise NoApiKey unless @public_key || @app_id
    end
  end
end
