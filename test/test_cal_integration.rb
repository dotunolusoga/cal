require_relative 'helper'

class TestCalIntegration < Minitest::Test

  def test_zero_arguments
    output = `./cal.rb`
    expected = <<EOS
Date not in acceptable format/range
EOS
    assert_equal expected, output
  end

  def test_months_that_start_on_Sunday
    output = `./cal.rb 01 2012`
    expected = <<EOS
    January 2012
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31
EOS
    assert_equal expected, output
  end

  ###########################
  ## Tests for Leap Years ###
  ##########################

  def test_regular_leap_years
    output = `./cal.rb 02 2012`
    expected = <<EOS
    February 2012
 Su Mo Tu We Th Fr Sa
           1  2  3  4
  5  6  7  8  9 10 11
 12 13 14 15 16 17 18
 19 20 21 22 23 24 25
 26 27 28 29
EOS
    assert_equal expected, output
  end

  def test_century_leap_years
    output = `./cal.rb 02 2000`
    expected = <<EOS
    February 2000
 Su Mo Tu We Th Fr Sa
        1  2  3  4  5
  6  7  8  9 10 11 12
 13 14 15 16 17 18 19
 20 21 22 23 24 25 26
 27 28 29
EOS
  assert_equal expected, output
  end

  def test_400_year_leap_years
    output = `./cal.rb 02 2400`
    expected = <<EOS
    February 2400
 Su Mo Tu We Th Fr Sa
        1  2  3  4  5
  6  7  8  9 10 11 12
 13 14 15 16 17 18 19
 20 21 22 23 24 25 26
 27 28 29
EOS
    assert_equal expected, output
  end

  #########################
  ## Testing for Months ###
  #########################

  def test_for_January
    output = `./cal.rb 01 2014`
    expected = <<EOS
    January 2014
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31
EOS
    assert_equal expected, output
  end

  def test_for_March
    output = `./cal.rb 03 2014`
    expected = <<EOS
    March 2014
Su Mo Tu We Th Fr Sa
                  1
2  3  4  5  6  7  8
9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
EOS
    assert_equal expected, output
  end

  def test_for_April
    output = `./cal.rb 04 2014`
    expected = <<EOS
    April 2014
Su Mo Tu We Th Fr Sa
      1  2  3  4  5
6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30
EOS
    assert_equal expected, output
  end

  def test_for_May
    output = `./cal.rb 05 2014`
    expected = <<EOS
    May 2014
Su Mo Tu We Th Fr Sa
           1  2  3
4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31
EOS
    assert_equal expected, output
  end

  def test_for_June
    output = `./cal.rb 06 2014`
    expected = <<EOS
    June 2014
Su Mo Tu We Th Fr Sa
1  2  3  4  5  6  7
8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30
EOS
    assert_equal expected, output
  end

  def test_for_July
    output = `./cal.rb 07 2014`
    expected = <<EOS
    July 2014
Su Mo Tu We Th Fr Sa
      1  2  3  4  5
6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30 31
EOS
    assert_equal expected, output
  end

  def test_for_August
    output = `./cal.rb 08 2014`
    expected = <<EOS
    August 2014
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
31
EOS
    assert_equal expected, output
  end

  def test_for_September
    output = `./cal.rb 09 2014`
    expected = <<EOS
    September 2014
 Su Mo Tu We Th Fr Sa
     1  2  3  4  5  6
  7  8  9 10 11 12 13
 14 15 16 17 18 19 20
 21 22 23 24 25 26 27
 28 29 30
EOS
    assert_equal expected, output
  end

  def test_for_October
    output = `./cal.rb 10 2014`
    expected = <<EOS
    October 2014
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31
EOS
    assert_equal expected, output
  end

  def test_for_November
    output = `./cal.rb 11 2014`
    expected = <<EOS
    November 2014
 Su Mo Tu We Th Fr Sa
                    1
  2  3  4  5  6  7  8
  9 10 11 12 13 14 15
 16 17 18 19 20 21 22
 23 24 25 26 27 28 29
 30
EOS
    assert_equal expected, output
  end

  def test_for_December
    output = `./cal.rb 12 2014`
    expected = <<EOS
    December 2014
 Su Mo Tu We Th Fr Sa
     1  2  3  4  5  6
  7  8  9 10 11 12 13
 14 15 16 17 18 19 20
 21 22 23 24 25 26 27
 28 29 30 31
EOS
    assert_equal expected, output
  end

  def test_for_minimum_date
    output = `./cal.rb 01 1800`
    expected = <<EOS
    January 1800
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31
EOS
    assert_equal expected, output
  end

  def test_for_maximum_date
    output = `./cal.rb 12 3000`
    expected = <<EOS
    December 3000
 Su Mo Tu We Th Fr Sa
     1  2  3  4  5  6
  7  8  9 10 11 12 13
 14 15 16 17 18 19 20
 21 22 23 24 25 26 27
 28 29 30 31
EOS
    assert_equal expected, output
  end

  ###############################################
  ## Tests for dates outside the allowed range ##
  ##############################################

  def test_for_date_too_early
    output = `./cal.rb 01 1799`
    expected = <<EOS
Date not in acceptable format/range
EOS
    assert_equal expected, output
  end

  def test_for_date_too_late
    output = `./cal.rb 04 3020`
    expected = <<EOS
Date not in acceptable format/range
EOS
    assert_equal expected, output
  end

  ##############################
  ## Tests for error cases ####
  #############################

  def test_for_invalid_month_argument
    output = `./cal.rb 2014`
    expected = <<EOS
Date not in acceptable format/range
EOS
    assert_equal expected, output
  end

  def test_for_invalid_year_argument
    output = `./cal.rb 02 14`
    expected = <<EOS
Date not in acceptable format/range
EOS
    assert_equal expected, output
  end

end
