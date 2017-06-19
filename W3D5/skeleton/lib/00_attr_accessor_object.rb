class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |method|
      define_method("#{method}=") do |val|
        instance_variable_set("@#{method}", val)
      end
      define_method("#{method}") do
        instance_variable_get("@#{method}")
      end
    end
  end
end
