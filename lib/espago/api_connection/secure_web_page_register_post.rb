module Espago
  class ApiConnection
    class SecureWebPageRegisterPost < ApiPost
      def request(params = {})
        super("secure_web_page_register", params)
      end
    end
  end
end
