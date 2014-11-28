module Espago
  class ApiConnection
    class InvoicesGet < ApiGet
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        super('invoices',params,params[:invoice_id])
      end
    end
  end
end
