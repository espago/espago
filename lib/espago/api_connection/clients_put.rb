module Espago
  class ApiConnection
    class ClientsPut < ApiPut
      def request(params = {})
        super("clients/#{params[:client_id]}", params)
      end
    end
  end
end
