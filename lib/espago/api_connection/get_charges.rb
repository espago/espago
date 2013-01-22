module Espago
  class ApiConnection
    class GetCharges
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        if params[:charge_id]
          @connection.get "charges/#{params[:charge_id]}"
        else
          @connection.get "charges", params
        end
      end
    end
  end
end
