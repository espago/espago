require "espago/api_connection"

module Espago
  class Router
    attr_accessor :path,  :method
    NoPathError = Class.new(StandardError)

    def initialize(path, method)
      @path, @method = path, method
    end

    def route
      raise NoPathError unless path_exists?
      get_route
    end

    def path_exists?
      get_route
      true
    rescue
      false
    end

    private
    def get_route
      Espago::ApiConnection.const_get get_class_name
    end

    def get_class_name
      method.to_s.capitalize + path.to_s.capitalize
    end
  end
end
