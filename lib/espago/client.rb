module Espago
  class Client
    attr_reader :public_key
    NoApiKey = Class.new(StandardError)

    def initialize(options = {})
      @public_key = options[:pub_key] || Options.public_key
      validate!
    end

    private
    def validate!
      raise NoApiKey unless @public_key
    end
  end
end
