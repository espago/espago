module Espago
  class ApiConnection
    class ClientsPost < ApiPost
      def request(params = {})
        super('clients', params)
      end
    end
  end
end
