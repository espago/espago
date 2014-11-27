module Espago
  class ApiConnection
    class PlansPost
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.post "plans", params
      end
    end
  end
end
