module Espago
  class ApiConnection
    class PostPlans
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.post "plans", params
      end
    end
  end
end
