module Espago
  class ApiConnection
    class RefundsPost < Api
      def request(params = {})
        super("refunds", params)
      end
    end
  end
end
