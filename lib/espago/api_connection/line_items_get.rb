module Espago
  class ApiConnection
    class LineItemsGet
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.get "invoices/#{params[:invoice_id]}/line_items"
      end
    end
  end
end
