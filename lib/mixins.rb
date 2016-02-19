module Mixins
  def serialize
    class_name = self.class.to_s.gsub('Cadooz::', '').downcase
    result = { class_name.to_sym => {} }

    self.instance_variables.each do |var|
      name = var.to_s.gsub('@', '').to_sym
      value = self.instance_variable_get(var)

      if value.class.method_defined? :serialize
        result[class_name.to_sym][name] = value.to_hash
      elsif !cadooz_class(value.class)
        result[class_name.to_sym][name] = value unless value.blank?
      end
    end

    result
  end

  def cadooz_class(klass)
    klass = klass.name.split('::').last.to_sym

    Cadooz.constants.include?(klass)
  end
end