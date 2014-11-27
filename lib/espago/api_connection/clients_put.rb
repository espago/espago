module Espago
  class ApiConnection
    class ClientsPut
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.put "clients/#{params[:client_id]}", params
      end
    end
  end
end
