require_relative 'helper'
require_relative '../lib/month'

class TestMonth < Minitest::Test

  def test_initializing_a_month_saves_values
    m = Month.new(05, 2015)
    assert_equal 05, m.month
    assert_equal 2015, m.year
  end

  def test_to_s_on_jan_2012
    m = Month.new(01, 2012)
    expected = <<EOS
    January 2012
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    assert_equal expected, m.to_s
  end

  def test_to_s_on_jan_2017
    m = Month.new(01, 2017)
    expected = <<EOS
    January 2017
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    assert_equal expected, m.to_s
  end

  def test_to_s_on_june_2015
    m = Month.new(06, 2015)
    expected = <<EOS
     June 2015
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30

EOS
    assert_equal expected, m.to_s
  end

  def test_to_s_on_sept_2015
    m = Month.new(9, 2015)
    expected = <<EOS
   September 2015
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30

EOS
    assert_equal expected, m.to_s
  end

  def test_days
    m = Month.new(02, 2014)
    expected = <<EOS
   February 2014
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28

EOS
    assert_equal expected, m.to_s
  end

  def test_for_march
    m = Month.new(05, 2009)
    assert_equal m.m_name, "May"
    assert_equal m.year, 2009
  end

  def test_for_january
    m = Month.new(01, 2010)
    assert_equal m.m_name, "January"
  end

  def test_for_november
    m = Month.new(11, 2030)
    assert_equal m.m_name, "November"
  end

  def test_for_days
    m = Month.new(02, 2000)
    assert_equal m.m_length, 29
  end

end
