module Espago
  class ApiConnection
    class ClientsSubscriptionsGet
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.get "clients/#{params[:client_id]}/subscriptions"
      end
    end
  end
end
