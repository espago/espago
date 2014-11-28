module Espago
  class ApiConnection
    class SubscriptionsDelete < ApiDelete
      def request(params = {})
        super("subscriptions",params[:subscription_id])
      end
    end
  end
end
