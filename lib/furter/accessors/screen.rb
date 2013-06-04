
module Furter
  module Accessors
    class Screen

      def initialize(screen_data)
        if screen_data.nil?
          @screen_data = MultiJson.load(Frank::Cucumber::Gateway.new.send_get('dump'))
        else
          @screen_data = screen_data
        end
      end

      def all_views
        add_views(@screen_data)
        @views
      end

      def add_views(json)
        json["subviews"].each do |view|
          add_view view
          add_views(view) unless view["subviews"].count == 0
        end
      end

      def view_class(label)
        view_by_label(@screen_data, label)[0]["class"]
      end

      def view_width(label)
        view_frame(label)["size"]["width"]
      end

      def view_height(label)
        view_frame(label)["size"]["height"]
      end

      def view_frame(label)
        view_by_label(@screen_data, label)[0]["frame"]
      end

      def view_visibility(label)
        view_by_label(@screen_data, label)[0]["isHidden"]
      end


      def view_by_id_2(id)
        view_by_id(@screen_data, id)
      end

      def view_by_id(json, id)
        if json["uid"].eql?(id)
          json
        else
          json["subviews"].each do |view|
            view_by_id(view, id)
          end
        end
      end

      def view_by_label(json,label)
        if json["accessibilityLabel"].eql? label
          json
        else
          json["subviews"].each do |view|
            view_by_label(view,label)
          end
        end
      end

      private
      def add_view(view)
        @views = [] unless @views
        @views << view
      end
    end
  end
end
