# frozen_string_literal: true

require 'minitest'
require 'minitest/autorun'

require_relative '../lib/priority_queue.rb'

class PriorityQueueTest < Minitest::Test
  # https://onlinejudge.u-aizu.ac.jp/courses/lesson/1/ALDS1/all/ALDS1_9_C
  def test_aizu_sample_case
    q = PriorityQueue.new([2, 7, 8])
    assert_equal 8, q.get
    assert_equal 8, q.pop
    q.push(19)
    q.push(10)
    assert_equal 19, q.pop
    assert_equal 10, q.pop
    q.append(8)
    assert_equal 8, q.pop
    assert_equal 7, q.pop
    q.<< 3
    q.push(4)
    q.push(1)
    assert_equal 4, q.pop
    assert_equal [3, 2, 1], q.heap
    assert_equal 3, q.pop
    assert_equal 2, q.pop
    assert_equal 1, q.pop
    assert_equal true, q.empty?
    assert_nil q.top
  end

  def test_asc_order
    q = HeapQueue.new { |x, y| x < y }
    q << 2
    q << 3
    q << 1
    assert_match /<PriorityQueue: @heap:\(1, 3, 2\), @comp:<Proc .+:\d+>>/, q.to_s
    assert_equal 1, q.pop
    assert_equal 2, q.pop
    assert_equal 3, q.pop
  end

  def test_initialize_without_argument
    pq = PriorityQueue.new
    assert_equal 0, pq.size
    assert_equal true, pq.empty?
    assert_nil pq.top
    assert_nil pq.pop
    assert_match /<PriorityQueue: @heap:\(\), @comp:<Proc .+:\d+>>/, pq.to_s

    pq << 0
    assert_equal 1, pq.size
    assert_equal false, pq.empty?

    pq.pop
    assert_equal 0, pq.size
    assert_equal true, pq.empty?
  end
end
