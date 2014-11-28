module Espago
  class ApiConnection
    class InvoiceItemsPost < ApiPost
      def request(params = {})
        super("invoice_items", params)
      end
    end
  end
end
