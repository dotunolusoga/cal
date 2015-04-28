require_relative 'helper'
require_relative '../lib/month'
require_relative '../lib/day'

class TestMonth < Minitest::Test

  def test_for_first_day_jan_2012
    m = Day.new(01, 2012)
    assert_equal 1, m.zellers
  end

  def test_for_first_day_feb_2014
    m = Day.new(02, 2014)
    assert_equal 7, m.zellers
  end

end
