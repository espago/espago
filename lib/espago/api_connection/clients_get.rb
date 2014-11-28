module Espago
  class ApiConnection
    class ClientsGet < ApiGet
      def initialize(connection)
        @connection = connection
      end

       def request(params = {})
        super('clients',params,params[:client_id])
      end
    end
  end
end
