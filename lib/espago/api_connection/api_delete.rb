module Espago
  class ApiConnection
    class ApiDelete < Api
      def request(path, param_id=nil)
        @connection.delete "#{path}/#{param_id}"
      end
    end
  end
end
