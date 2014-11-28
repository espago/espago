module Espago
  class ApiConnection
    class ClientsSubscriptionsGet < ApiGet
      def request(params = {})
        super("clients/#{params[:client_id]}/subscriptions")
      end
    end
  end
end
