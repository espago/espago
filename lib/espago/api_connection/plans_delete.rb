module Espago
  class ApiConnection
    class PlansDelete
      def initialize(connection)
        @connection = connection
      end

      def request(params = {})
        @connection.delete "plans/#{params[:plan_id]}"
      end
    end
  end
end
