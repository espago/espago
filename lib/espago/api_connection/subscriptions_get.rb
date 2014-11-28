module Espago
  class ApiConnection
    class SubscriptionsGet < ApiGet
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        super('subscriptions',params,params[:subscription_id])
      end
    end
  end
end
