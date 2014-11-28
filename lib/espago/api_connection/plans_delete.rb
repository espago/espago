module Espago
  class ApiConnection
    class PlansDelete < ApiDelete
      def request(params = {})
        super("plans",params[:plan_id])
      end
    end
  end
end
