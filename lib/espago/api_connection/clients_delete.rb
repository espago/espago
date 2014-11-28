module Espago
  class ApiConnection
    class ClientsDelete < ApiDelete
      def request(params = {})
       super("clients",params[:client_id])
      end
    end
  end
end
