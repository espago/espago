module Espago
  class ApiConnection
    class PostCharges
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.post "charges", params
      end
    end
  end
end
