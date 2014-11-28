module Espago
  class ApiConnection
    class LineItemsGet < ApiGet
      def request(params = {})
        super("invoices/#{params[:invoice_id]}/line_items")
      end
    end
  end
end
