module Espago
  class ApiConnection
    class SubscriptionsPost
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.post "subscriptions", params
      end
    end
  end
end