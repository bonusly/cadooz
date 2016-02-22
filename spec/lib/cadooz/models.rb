require 'spec_helper'

describe Cadooz::Model do

  describe "immutable class attributes" do
    Dir.foreach('/lib/cadooz/models/immutable') do |model|
      mock = mock(Object::const_get('Cadooz::' + model.chomp('rb').capitalize).new(OpenStruct.new))

      mock.instance_variables do |var|
        mock.instance_variable_set(var, 'test').should raise_error
      end
    end
  end

  describe "mutable class attributes" do
    Dir.foreach('lib/cadooz/models/mutable') do |model|

    end
  end

end