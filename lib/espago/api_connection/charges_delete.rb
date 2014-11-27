module Espago
  class ApiConnection
    class ChargesDelete
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.delete "charges/#{params[:charge_id]}"
      end
    end
  end
end
