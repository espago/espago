module Espago
  class ApiConnection
    class PlansGet < ApiGet
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        super('plans',params,params[:plan_id])
      end
    end
  end
end
