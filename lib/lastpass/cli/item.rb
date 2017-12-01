module Lastpass
  module CLI
    class Item

      def self.attributes
        %w[id name folder username modified_at password notes]
      end

      attr_accessor *attributes

      def initialize(attrs)
        attrs.each do |k, v|
          set(k.to_s, v)
        end
      end

      def set(attribute, value)
        if self.class.attributes.include?(attribute)
          send("#{attribute}=", value)
        end
      end
    end
  end
end
