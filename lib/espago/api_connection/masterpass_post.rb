module Espago
  class ApiConnection
    class MasterpassPost < ApiPost
      def request(params = {})
        super("masterpass", params)
      end
    end
  end
end
