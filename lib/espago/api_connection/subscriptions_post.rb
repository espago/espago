module Espago
  class ApiConnection
    class SubscriptionsPost < ApiPost
      def request(params = {})
        super("subscriptions", params)
      end
    end
  end
end
