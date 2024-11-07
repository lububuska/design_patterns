require 'minitest/autorun'
require './class_array.rb'

class Tests < Minitest::Test
  def setup
    @array = ArrayMethods.new([1, 2, -3, 4, 5, 11, 7, 33, 9, 10])
    @string_array = ArrayMethods.new(["apple", "banana", "kiwi", "pear", "fig"])
    @hash_array = ArrayMethods.new([{age: 30}, {age: 25}, {age: 40}, {age: 20}])
  end

  def test_count_odd
    result = @array.count{|x| x.odd?}
    expected = 7
    assert_equal(expected, result)
  end 

  def test_count_negative
    result = @array.count{|x| x < 0}
    expected = 1
    assert_equal(expected, result)
  end 

  def test_filter_map_minus_one_if_even
    result = @array.filter_map{|x| x - 1 if x.even?}
    expected = [1, 3, 9]
    assert_equal(expected, result)
  end 

  def test_filter_map_div_two_if_div_three
    result = @array.filter_map{|x| x / 2.0 if x % 3 == 0}
    expected = [-1.5, 16.5, 4.5]
    assert_equal(expected, result)
  end 

  def test_group_by_odd
    result = @array.group_by{|x| x.odd?}
    expected = {true=>[1, -3, 5, 11, 7, 33, 9], false=>[2, 4, 10]}
    assert_equal(expected, result)
  end
  
  def test_group_by_negative
    result = @array.group_by{|x| x < 0}
    expected = {true=>[-3], false=>[1, 2, 4, 5, 11, 7, 33, 9, 10]}
    assert_equal(expected, result)
  end

  def test_min_by_string_length
    result = @string_array.min { |a, b| a.length <=> b.length }
    expected = "fig"
    assert_equal(expected, result)
  end

  def test_min_by_hash_key
    result = @hash_array.min { |a, b| a[:age] <=> b[:age] }
    expected = {age: 20}
    assert_equal(expected, result)
  end

  def test_partition_odd
    result = @array.partition{|x| x.odd?}
    expected = [[1, -3, 5, 11, 7, 33, 9], [2, 4, 10]]
    assert_equal(expected, result)
  end

  def test_partition_negative
    result = @array.partition{|x| x < 0}
    expected = [[-3], [1, 2, 4, 5, 11, 7, 33, 9, 10]]
    assert_equal(expected, result)
  end

  def test_take_while_less_10
    result = @array.take_while{|x| x < 10}
    expected = [1, 2, -3, 4, 5]
    assert_equal(expected, result)
  end

  def test_take_while_positive
    result = @array.take_while{|x| x > 0}
    expected = [1, 2]
    assert_equal(expected, result)
  end
end
