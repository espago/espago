module Espago
  class ApiConnection
    class CompletePost
      def initialize(connection)
        warn "[DEPRECATION] `complete` is deprecated.  Please use `charges_complete` instead."
        @connection = connection
      end

      def request(params = {})
        @connection.post "charges/#{params[:charge_id]}/complete"
      end
    end
  end
end
