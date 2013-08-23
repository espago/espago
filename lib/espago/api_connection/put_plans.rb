module Espago
  class ApiConnection
    class PutPlans
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.put "plans/#{params[:plan_id]}", params
      end
    end
  end
end
