require 'spec_helper'

describe Cadooz do

  describe "immutable class attributes" do
    Dir.foreach(Dir.pwd + '/lib/cadooz/models/immutable') do |model|
      next if ['.', '..'].include?(model)

      name = 'Cadooz::Immutable::' + model.chomp('.rb').split('_').collect(&:capitalize).join
      immutable_class = Object::const_get(name).new(OpenStruct.new)

      it "should throw an exception when attempting to set an instance variable" do
        immutable_class.instance_variables.each do |var|
          expect { immutable_class.instance_variable_set(var, 'test') }.to raise_error(RuntimeError)
        end
      end

      it "should throw an exception when attempting to assign to an instance variable" do
        immutable_class.instance_variables.each do |var|
          plain_name = var.to_s.gsub(':@', '')
          expect { immutable_class.send(plain_name + '=', 'test') }.to raise_error(NoMethodError)
        end
      end
    end
  end

  describe "mutable class attributes" do
    Dir.foreach(Dir.pwd + '/lib/cadooz/models/mutable') do |model|
      next if ['.', '..'].include?(model)

      name = 'Cadooz::Mutable::' + model.chomp('.rb').split('_').collect(&:capitalize).join
      mutable_class = Object::const_get(name).new

      it "should succeed when attemption to set an instance variable" do
        mutable_class.instance_variables.each do |var|
          expect { mutable_class.instance_variable_set(var, 'test') }.to be_truthy
        end
      end

      it "should succeed when attempting to assign to an instance variable" do
        mutable_class.instance_variables.each do |var|
          plain_name = var.to_s.gsub(':@', '')
          expect { mutable_class.send(plain_name + '=', 'test') }.to be_truthy
        end
      end
    end
  end

end