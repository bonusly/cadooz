require 'spec_helper'

RSpec::Matchers.define :mutable_block do
  match do |actual|
    actual.is_a? Proc
    actual.call == 'test'
  end

  def supports_block_expectations?
    true
  end
end

describe Cadooz do

  describe "immutable class attributes" do
    Dir.foreach('./lib/cadooz/models/immutable') do |model|
      next if ['.', '..'].include?(model) || model.include?('response.rb')

      name = 'Cadooz::Immutable::' + model.chomp('.rb').split('_').collect(&:capitalize).join
      immutable_class = Object::const_get(name).new(OpenStruct.new)

      context "set instance variables" do
        immutable_class.instance_variables.each do |var|
          specify { expect { immutable_class.instance_variable_set(var, 'test') }.to raise_error(RuntimeError) }
        end
      end

      context "assign instance variables" do
        immutable_class.instance_variables.each do |var|
          plain_name = var.to_s.gsub(':@', '')
          specify { expect { immutable_class.send(plain_name + '=', 'test') }.to raise_error(NoMethodError) }
        end
      end
    end
  end

  describe "mutable class attributes" do
    Dir.foreach('./lib/cadooz/models/mutable') do |model|
      next if ['.', '..'].include?(model)

      name = 'Cadooz::Mutable::' + model.chomp('.rb').split('_').collect(&:capitalize).join
      mutable_class = Object::const_get(name).new

      context "set instance variables" do
        mutable_class.instance_variables.each do |var|
          specify { expect { mutable_class.instance_variable_set(var, 'test') }.to mutable_block }
        end
      end

      context "assign instance variables" do
        mutable_class.instance_variables.each do |var|
          plain_name = var.to_s.gsub('@', '')
          specify { expect { mutable_class.send(plain_name + '=', 'test') }.to mutable_block }
        end
      end
    end
  end

end