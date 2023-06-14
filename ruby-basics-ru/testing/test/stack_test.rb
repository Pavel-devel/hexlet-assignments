# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new
  end

  def test_element_to_array
    expected_variable = []
    assert_equal expected_variable, @stack.to_a
  end

  def test_empty_array
    expected_array = true
    assert_equal expected_array, @stack.empty?
  end

  def test_size_array
    expected_size_array = 0
    assert_equal expected_size_array, @stack.size
  end

  def test_push_element_in_array
    element1 = 'ruby'
    element2 = 'php'
    element3 = 'java'
    expected_element = %w[ruby php java]
    @stack.push!(element1)
    @stack.push!(element2)
    @stack.push!(element3)
    assert_equal expected_element, @stack.instance_variable_get(:@elements)
  end

  def test_size_in_array
    @stack = %w[ruby php java]
    expected_size = 3
    assert_equal expected_size, @stack.size
  end

  def test_not_empty_array
    @stack = %w[ruby php java]
    expected_empty = false
    assert_equal expected_empty, @stack.empty?
  end

  def test_delete_element_in_array
    @stack = %w[ruby php java]
    expected_delete = %w[ruby php]
    @stack.pop
    assert_equal expected_delete, @stack.to_a
  end

  def test_size_in_new_array
    @stack = %w[ruby php]
    expected_size = 2
    assert_equal expected_size, @stack.size
  end

  def test_clear_array
    @stack = []
    expected_clear = []
    @stack.clear
    assert_equal expected_clear, @stack.to_a
  end

  def test_empty_clear_array
    @stack = []
    expected_empty = true
    assert_equal expected_empty, @stack.empty?
  end
  # END
end

test_methods = StackTest.new({}).methods
                        .select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
