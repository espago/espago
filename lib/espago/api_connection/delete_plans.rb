module Espago
  class ApiConnection
    class DeletePlans
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.delete "plans/#{params[:plan_id]}"
      end
    end
  end
end
