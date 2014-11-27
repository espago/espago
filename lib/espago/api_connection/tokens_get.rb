module Espago
  class ApiConnection
    class TokensGet
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.get "tokens/#{params[:token_id]}"
      end
    end
  end
end
