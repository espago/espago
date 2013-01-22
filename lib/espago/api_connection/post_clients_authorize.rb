module Espago
  class ApiConnection
    class PostClientsAuthorize
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.post "clients/#{params[:client_id]}/authorize"
      end
    end
  end
end
