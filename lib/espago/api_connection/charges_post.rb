module Espago
  class ApiConnection
    class ChargesPost < ApiPost
      def request(params = {})
        super("charges", params)
      end
    end
  end
end
