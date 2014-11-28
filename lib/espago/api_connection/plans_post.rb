module Espago
  class ApiConnection
    class PlansPost < ApiPost
      def request(params = {})
        super("plans", params)
      end
    end
  end
end
