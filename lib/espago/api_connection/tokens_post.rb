module Espago
  class ApiConnection
    class TokensPost < ApiPost
      def initialize(connection)
        @connection = connection
        @connection.request(:authorization, :basic, Espago.public_key, '')
      end

      def request(params = {})
        super("tokens", params)
      end
    end
  end
end
