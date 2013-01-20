module Espago
  class ApiConnection
    class GetClients
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.get('clients')
      end
    end
  end
end
