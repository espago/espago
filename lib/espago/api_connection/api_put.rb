module Espago
  class ApiConnection
    class ApiPut < Api
      def request(path, params={})
        @connection.put path, params
      end
    end
  end
end
