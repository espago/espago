module Espago
  class ApiConnection
    class ClientsInvoicesGet
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.get "clients/#{params[:client_id]}/invoices"
      end
    end
  end
end
