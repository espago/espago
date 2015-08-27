module Espago
  class ApiConnection
    class DccDecisionPost < Api
      def request(params = {})
        @connection.post "charges/#{params[:charge_id]}/dcc_decision", params
      end
    end
  end
end
