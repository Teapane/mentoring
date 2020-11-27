require './lib/connect_four'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ConnectFourTest < Minitest::Test


  def setup
    @board_horizontal_win =
      [
        %w| nil nil nil nil nil nil |,
        %w| nil nil nil red red nil |,
        %w| nil nil nil red black nil |,
        %w| black nil red nil black nil |,
        %w| red red red red black black |,
        %w| black red black black red black |
    ]

    @board_vertical_win =
      [
        %w| black nil nil nil nil nil |,
        %w| black nil nil red red nil |,
        %w| black nil nil red black nil |,
        %w| black nil red nil black nil |,
        %w| red red red red black black |,
        %w| black red black black red black |
    ]
  end

  def test_a_horizontal_win
    result = ConnectFour.winner(@board_horizontal_win)
    assert_equal 'red', result
  end

  def test_a_vertical_win
    result = ConnectFour.winner(@board_vertical_win)
    assert_equal 'black', result
  end
end
