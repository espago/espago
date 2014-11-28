module Espago
  class ApiConnection
    class ClientsAuthorizePost < ApiPost
      def request(params = {})
        super("clients/#{params[:client_id]}/authorize")
      end
    end
  end
end
