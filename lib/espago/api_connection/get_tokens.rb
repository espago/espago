module Espago
  class ApiConnection
    class GetTokens
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.get "tokens/#{params[:token_id]}"
      end
    end
  end
end
