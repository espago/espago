module Espago
  class ApiConnection
    class PlansPut < ApiPut
      def request(params = {})
        super("plans/#{params[:plan_id]}", params)
      end
    end
  end
end
