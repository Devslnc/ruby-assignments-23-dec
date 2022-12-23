def counter(value = 0)
  counter_value = -> { value }
  increment = -> { value += 1 }

  [counter_value, increment]
end

counter_object = counter(7)
counter_object[1].call
puts counter_object[0].call


require 'rails_helper'

RSpec.describe 'Counter Function' do
  let!(:counter_method_array) { counter(3) }
  let!(:counter_method_another_object) { counter(100) }

  describe 'Counter method returns array of methods' do
    it 'Increases the internal counter value by one' do
      expect(counter()).to be_an_instance_of(Array)
    end

    it 'Returns the current counter value' do
      expect(counter_method_array[0].call).to eql(3)
    end

    it 'Increases the internal counter value by one' do
      expect(counter_method_array[1].call).to eql(4)
    end

    it 'Create independent instances of counter with Multiple calls' do
      counter_method_array[1].call
      counter_method_another_object[1].call
      expect(counter_method_array).not_to eql(counter_method_another_object)
    end
  end
end
