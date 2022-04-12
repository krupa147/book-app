# module Query
  module Books
    class Sort
      def initialize(collection:)
        @collection = collection
        @sql = ''
      end

      def sort_by(params)
        return @collection if params.empty?
        @sql = 
          if params.size == 1
            send("sort_by_#{params}")
          else
            params.map { |params| send("by_#{params}") }.join(", ")
          end
          @collection.order(@sql)
      end

      private

      def by_author_last_name
        "author_last_name ASC"
      end

      def by_author_first_name
        "author_first_name ASC"
      end

      def by_publisher
        "publisher ASC"
      end

      def by_title
        "publisher ASC"
      end
    end
  end
# end