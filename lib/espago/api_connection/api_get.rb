module Espago
  class ApiConnection
    class ApiGet
      def request(path, params = {}, param_id=nil)
        if param_id
          @connection.get "#{path}/#{param_id}"
        else
          @connection.get "#{path}", params
        end
      end
    end
  end
end
