
require_relative "day"

class Month

  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
    @days = days
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

  def m_length
    if month == 1 || month == 3 || month == 7 || month == 8 || month == 10 || month == 12
      return 31
    elsif month == 4 || month == 6 || month == 9 || month == 11
      return 30
    elsif month == 2 && (year % 4 == 0 || (year % 100 == 0 && year % 400 == 0))
      29
    else
      28
    end
  end

  def weeks
    "Su Mo Tu We Th Fr Sa"
  end


  def days
    new_line = "\n"
    day = (1..m_length).to_a
    days_in_month = ''
    count = " "
    d = Day.new(month, year)
    day_start = d.zellers

    day_start = day_start.to_i
    (day_start - 1).times do
      day.unshift(count)
    end

    day.each_slice(7) do |i|
      days_in_month << i.map { |i| i.to_s.rjust(2) }.join(" ") + new_line
    end
    line_count = days_in_month.lines.count
    if line_count == 4
      days_in_month << new_line + new_line
    elsif line_count == 5
      days_in_month << new_line
    else
    days_in_month
    end
  end

  def to_s
    string = ("#{m_name} #{year}").center(20).rstrip + "\n" + "#{weeks}" + "\n" + "#{days}"
  end

end
