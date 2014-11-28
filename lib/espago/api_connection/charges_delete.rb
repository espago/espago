module Espago
  class ApiConnection
    class ChargesDelete < ApiDelete
      def request(params = {})
        super("charges",params[:charge_id])
      end
    end
  end
end
