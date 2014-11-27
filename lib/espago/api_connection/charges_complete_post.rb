module Espago
  class ApiConnection
    class ChargesCompletePost
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.post "charges/#{params[:charge_id]}/complete"
      end
    end
  end
end
