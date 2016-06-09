module Mixins
  def serialize(data_only = false)
    class_name = self.class.to_s.gsub(/Cadooz::[a-z]*::/i, '').underscore
    result = data_only ? {} : { class_name.to_sym => {} }

    hash_assign = ->name, value { data_only ? result[name] = value : result[class_name.to_sym][name] = value }

    self.instance_variables.each do |var|
      name = var.to_s.gsub('@', '').to_sym
      value = self.instance_variable_get(var)

      if value.class.method_defined? :serialize
        hash_assign.(name, value.serialize(true)) unless instance_variables_empty?(value)
      elsif value.class == Array
        arr = []
        value.each do |val|
          arr << val.serialize(true) unless instance_variables_empty?(val)
        end
        hash_assign.(name, arr) unless arr.blank?
      elsif !cadooz_class(value.class)
        hash_assign.(name, value) unless value.blank?
      end
    end

    result
  end

  def instance_variables_empty?(instance)
    instance.instance_variables.each do |var|
      return false unless instance.instance_variable_get(var).blank?
    end

    true
  end

  def cadooz_class(klass)
    klass = klass.name.split('::').last.to_sym

    Cadooz.constants.include?(klass)
  end

  def default_value_for_nil
    self.instance_variables.each do |var|
      value = self.instance_variable_get(var)
      self.instance_variable_set(var, 'not available') if value.blank?
    end
  end
end

class String
  def underscore
    self.gsub(/::/, '/').
        gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
        gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr("-", "_").
        downcase
  end
end