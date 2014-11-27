module Espago
  class ApiConnection
    class SubscriptionsGet
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        if params[:subscription_id]
          @connection.get "subscriptions/#{params[:subscription_id]}"
        else
          @connection.get "subscriptions", params
        end
      end
    end
  end
end
