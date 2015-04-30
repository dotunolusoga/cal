
require_relative "day"

class Month

  attr_reader :month, :year


  DAYS = "Su Mo Tu We Th Fr Sa"


  def initialize(month, year)
    @month = month.to_i
    @year = year.to_i
  end

  def m_name
     m_name = { 1 => "January",
       2 => "February",
       3 => "March",
       4 => "April",
       5 => "May",
       6 => "June",
       7 => "July",
       8 => "August",
       9 => "September",
      10 => "October",
      11 => "November",
      12 => "December"
      }
      m_name[month]
  end

  def leap_year
    (year % 4 == 0 || (year % 100 == 0 && year % 400 == 0))
  end

  def m_length
    month_31_days = [1, 3, 5, 7, 8, 10, 12]
    month_30_days = [4, 6, 9, 11]

    if month_31_days.include? month
      31
    elsif month_30_days.include? month
      30
    elsif month == 2 && leap_year
      29
    else
      28
    end
  end

  def days
    new_line = "\n"
    day = (1..m_length).to_a
    days_in_month = ''
    space_str = " "
    d = Day.new(month, year)
    day_start = d.zellers

    day_start = day_start.to_i
    (day_start - 1).times do
      day.unshift(space_str)
    end

    day.each_slice(7) do |i|
      days_in_month << i.map { |i| i.to_s.rjust(2) }.join(" ") + new_line
    end
    line_count = days_in_month.lines.count
    until line_count = 6
      days_in_month << new_line
    end
    days_in_month
  end

  def to_s
    month_string = "#{m_name} #{year}".center(20).rstrip + "\n" + "#{DAYS}" + "\n" + "#{days}" + "\n"
  end

end
