module Espago
  class ApiConnection
    class ChargesGet < ApiGet
      def request(params = {})
        super('charges',params,params[:charge_id])
      end
    end
  end
end
