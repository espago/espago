module Espago
  class ApiConnection
    class TokensPost
      def initialize(connection)
        @connection = connection
        @connection.basic_auth(Espago.public_key, '')
      end

      def request(params = {})
        @connection.post "tokens", params
      end
    end
  end
end
