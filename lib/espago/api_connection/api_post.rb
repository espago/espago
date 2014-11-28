module Espago
  class ApiConnection
    class ApiPost < Api
      def request(path, params = {})
        @connection.post path, params
      end
    end
  end
end
