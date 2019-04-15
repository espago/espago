module Espago
  class ApiConnection
    class ChargesCompletePost < ApiPost
      def request(params = {})
        super("charges/#{params[:charge_id]}/complete", params.except(:charge_id))
      end
    end
  end
end
