require "active_support/inflector"
require "espago/api_connection"

module Espago
  class Router
    NoPathError = Class.new(StandardError)

    class <<  self
      def path_to(path, method)
        class_name = get_class_name(path, method)
        Espago::ApiConnection.const_get class_name
      rescue
        raise NoPathError
      end

      private
      def get_class_name(path, method)
        method.to_s.camelize + path.to_s.camelize
      end
    end
  end
end
