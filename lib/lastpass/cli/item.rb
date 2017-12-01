module Lastpass
  module CLI
    class Item
      attr_accessor :id, :name, :folder, :username, :modified_at
      def initialize(attrs)
        self.id = attrs['id']
        self.name = attrs['name']
        self.username = attrs['username']
        self.folder = attrs['folder']
        self.modified_at = attrs['modified_at']
      end
    end
  end
end
