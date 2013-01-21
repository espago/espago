module Espago
  class ApiConnection
    class GetClients
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        if params[:client_id]
          @connection.get "clients/#{params[:client_id]}"
        else
          @connection.get "clients"
        end
      end
    end
  end
end
