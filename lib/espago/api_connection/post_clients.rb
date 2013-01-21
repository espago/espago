module Espago
  class ApiConnection
    class PostClients
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.post 'clients', params
      end
    end
  end
end
