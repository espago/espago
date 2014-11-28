module Espago
  class ApiConnection
    class TokensPost < ApiPost
      def initialize(connection)
        @connection = connection
        @connection.basic_auth(Espago.public_key, '')
      end

      def request(params = {})
        super("tokens", params)
      end
    end
  end
end
