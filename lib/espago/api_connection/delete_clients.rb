module Espago
  class ApiConnection
    class DeleteClients
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.delete "clients/#{params[:client_id]}"
      end
    end
  end
end
