module Espago
  class ApiConnection
    class ChargesGet < ApiGet
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        super('charges',params,params[:charge_id])
      end
    end
  end
end
