module Espago
  class ApiConnection
    class RefundsPost < ApiPost
      def request(params = {})
        super("refunds", params)
      end
    end
  end
end
