module Furter
  module Accessors
    class Screen

      def big_dump
        send_get('dump')
      end

      def get_window(element)
        big_dump[element]
      end

      def get_view_by_id(id)
        big_dump
      end

    end
  end
end
