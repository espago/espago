module Espago
  class ApiConnection
    class VisacheckoutPost < ApiPost
      def request(params = {})
        super("visacheckout", params)
      end
    end
  end
end
