module Espago
  class ApiConnection
    class ClientsPost
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.post 'clients', params
      end
    end
  end
end
