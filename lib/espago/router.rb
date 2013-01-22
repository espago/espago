require "active_support/inflector"
require "espago/api_connection"

module Espago
  class Router
    attr_accessor :path,  :method
    NoPathError = Class.new(StandardError)

    def initialize(path, method)
      @path, @method = path, method
    end

    def route
      get_route
    rescue
      raise NoPathError
    end

    private
    def get_route
      Espago::ApiConnection.const_get get_class_name
    end

    def get_class_name
      method.to_s.camelize + path.to_s.camelize
    end
  end
end
