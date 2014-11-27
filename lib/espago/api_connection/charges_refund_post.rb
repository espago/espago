module Espago
  class ApiConnection
    class ChargesRefundPost
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.post "charges/#{params[:charge_id]}/refund", params
      end
    end
  end
end
