module Espago
  class ApiConnection
    class ChargesRefundPost < Api
      def request(params = {})
        @connection.post "charges/#{params[:charge_id]}/refund", params
      end
    end
  end
end
