require "minitest/autorun"
require "minitest/pride"
require "./lib/tower"

class TowerTest < Minitest::Test

  def test_valid_move?
    t = Tower.new

    assert t.valid_move?([3,2,1])
    assert t.valid_move?([3,1])
    assert t.valid_move?([3,2])
    refute t.valid_move?([2,3])
    refute t.valid_move?([1,3])
  end

  def test_piece_can_move?
    t = Tower.new

    assert t.piece_can_move?([3,2,1], 1)
    refute t.piece_can_move?([3,2], 3)
  end

  def test_find_largest_piece
    t = Tower.new
    test_posts = {"A" => [2], "B" => [3], "C" => [1]}

    assert_equal "B", t.find_piece(3, test_posts)
    assert_equal "A", t.find_piece(2, t.posts)
  end

  def test_find_largest_that_can_move
    t = Tower.new

    assert_equal "A", t.find_largest_that_can_move
  end

  def test_find_farthest_possible_move
    t = Tower.new

    assert_equal "C", t.find_farthest_possible_move("A")
  end

  def test_move_makes_correct_move
    t = Tower.new

    assert_equal [3,2,1], t.posts["A"]
    assert_equal [], t.posts["C"]

    t.move!

    assert_equal [3,2], t.posts["A"]
    assert_equal [1], t.posts["C"]

    t.move!

    assert_equal [3], t.posts["A"]
    assert_equal [2], t.posts["B"]
    assert_equal [1], t.posts["C"]
  end



end
