module Espago
  class ApiConnection
    class ChargesInitPost < Api
      def request(params = {})
        @connection.post 'charges/init', params
      end
    end
  end
end
