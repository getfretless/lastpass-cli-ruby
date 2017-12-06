module LastpassCLI
  class Item
    def self.attributes
      %w[id name folder username modified_at password notes number]
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
