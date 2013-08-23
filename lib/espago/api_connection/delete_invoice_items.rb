module Espago
  class ApiConnection
    class DeleteInvoiceItems
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.delete "invoice_items/#{params[:invoice_item_id]}"
      end
    end
  end
end
