require 'test_helper'

require 'lib/array_extensions'
require 'active_record'
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
  
  test "ActiveRecord::Base.randomly_select" do
    class Foobar < ActiveRecord::Base  
      def self.all(options)
        (1..100).map{|nr| "foo#{nr}" }
      end
    end
    
    assert Foobar.randomly_select(:limit => 5).size == 5
    assert Foobar.randomly_select(:limit => 3, :factor => 40).size == 3
    assert_raise(MeWantRandom::ArgumentError) { Foobar.randomly_select({:limit => 5}, {:limit => 10}) }
  end
  
end
