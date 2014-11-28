module Espago
  class ApiConnection
    class SubscriptionsGet < ApiGet
      def request(params = {})
        super('subscriptions',params,params[:subscription_id])
      end
    end
  end
end
