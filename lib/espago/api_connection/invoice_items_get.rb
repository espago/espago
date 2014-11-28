module Espago
  class ApiConnection
    class InvoiceItemsGet < ApiGet
      def request(params = {})
        super("invoice_items",{},params[:invoice_item_id])
      end
    end
  end
end
