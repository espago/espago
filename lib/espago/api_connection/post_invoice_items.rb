module Espago
  class ApiConnection
    class PostInvoiceItems
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.post "invoice_items", params
      end
    end
  end
end
