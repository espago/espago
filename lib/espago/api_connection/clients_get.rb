module Espago
  class ApiConnection
    class ClientsGet
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        if params[:client_id]
          @connection.get "clients/#{params[:client_id]}"
        else
          @connection.get "clients", params
        end
      end
    end
  end
end
