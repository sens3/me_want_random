require 'test_helper'
require 'lib/array_extensions'
require 'lib/active_record_base_extensions'

class MeWantRandomTest < ActiveSupport::TestCase
  
  test "Array#randomize" do
    array = [1,2,3,4,5,6,7]
    randomized_array = array.randomize
    assert array.length == randomized_array.length
    assert array != randomized_array
    array.each do |el|
      assert randomized_array.include?(el)
    end
  end
  
end
