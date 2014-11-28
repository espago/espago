module Espago
  class ApiConnection
    class CompletePost < ApiPost
      def initialize(connection)
        warn "[DEPRECATION] `complete` is deprecated.  Please use `charges_complete` instead."
        super(connection)
      end

      def request(params = {})
        super("charges/#{params[:charge_id]}/complete")
      end
    end
  end
end
