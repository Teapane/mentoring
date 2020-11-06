require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'roman'

class RomanTest < MiniTest::Test
  def klass
    Roman
  end

  def test_negatives
    assert_equal 'Cannot Compute!', klass.to_roman(-1)
  end

  def test_zero
    assert_equal 'Cannot Compute!', klass.to_roman(0)
  end

  def test_strings
    assert_equal 'Cannot Compute!', klass.to_roman("This is not a number")
  end

  def test_other_types
    assert_equal 'Cannot Compute!', klass.to_roman({foo: "bar"})
    assert_equal 'Cannot Compute!', klass.to_roman(["array", "of", "things"])
  end

  def test_1
    assert_equal 'I', klass.to_roman(1)
  end

  def test_2
    assert_equal 'II', klass.to_roman(2)
  end

  def test_3
    assert_equal 'III', klass.to_roman(3)
  end

  def test_4
    assert_equal 'IV', klass.to_roman(4)
  end

  def test_5
    assert_equal 'V', klass.to_roman(5)
  end

  def test_6
    assert_equal 'VI', klass.to_roman(6)
  end

  def test_9
    assert_equal 'IX', klass.to_roman(9)
  end

  def test_27
    assert_equal 'XXVII', klass.to_roman(27)
  end

  def test_48
    assert_equal 'XLVIII', klass.to_roman(48)
  end

  def test_59
    assert_equal 'LIX', klass.to_roman(59)
  end

  def test_93
    assert_equal 'XCIII', klass.to_roman(93)
  end

  def test_141
    assert_equal 'CXLI', klass.to_roman(141)
  end

  def test_163
    assert_equal 'CLXIII', klass.to_roman(163)
  end

  def test_402
    assert_equal 'CDII', klass.to_roman(402)
  end

  def test_575
    assert_equal 'DLXXV', klass.to_roman(575)
  end

  def test_911
    assert_equal 'CMXI', klass.to_roman(911)
  end

  def test_1024
    assert_equal 'MXXIV', klass.to_roman(1024)
  end

  def test_3000
    assert_equal 'MMM', klass.to_roman(3000)
  end
end
