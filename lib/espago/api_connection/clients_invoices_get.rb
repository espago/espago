module Espago
  class ApiConnection
    class ClientsInvoicesGet < ApiGet
      def request(params = {})
        super("clients/#{params[:client_id]}/invoices")
      end
    end
  end
end
