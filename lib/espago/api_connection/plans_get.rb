module Espago
  class ApiConnection
    class PlansGet
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        if params[:plan_id]
          @connection.get "plans/#{params[:plan_id]}"
        else
          @connection.get "plans", params
        end
      end
    end
  end
end
