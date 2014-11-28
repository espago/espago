module Espago
  class ApiConnection
    class TokensGet < ApiGet
      def request(params = {})
        super("tokens",{},params[:token_id])
      end
    end
  end
end
