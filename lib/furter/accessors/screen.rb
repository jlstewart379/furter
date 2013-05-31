module Furter
  module Accessors
    class Screen


      def big_dump
        send_get('dump')
      end

      def get_window(element)
        big_dump[element]
      end

    end
  end
end
