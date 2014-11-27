module Espago
  class ApiConnection
    class InvoicesGet
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        if params[:invoice_id]
          @connection.get "invoices/#{params[:invoice_id]}"
        else
          @connection.get "invoices", params
        end
      end
    end
  end
end
