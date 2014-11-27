module Espago
  class ApiConnection
    class SubscriptionsDelete
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.delete "subscriptions/#{params[:subscription_id]}"
      end
    end
  end
end
