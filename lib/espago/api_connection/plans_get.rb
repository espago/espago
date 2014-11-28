module Espago
  class ApiConnection
    class PlansGet < ApiGet
      def request(params = {})
        super('plans',params,params[:plan_id])
      end
    end
  end
end
