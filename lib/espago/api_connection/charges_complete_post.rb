module Espago
  class ApiConnection
    class ChargesCompletePost < ApiPost
      def request(params = {})
        super("charges/#{params[:charge_id]}/complete")
      end
    end
  end
end
