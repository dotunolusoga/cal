
class Month

  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
    @days = days
  end


  def to_s
    <<EOS
    #{m_name} #{year}
Su Mo Tu We Th Fr Sa
#{days}
EOS
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

  def days
    new_line = "\n"
    one_space = " "
    day = (1..m_length)

    day2 = day.each_with_index.map do |x, i|
      if x % 7 > 0
        (i + 1).to_s.rjust(2)
      elsif i % 7 == 0
        i.to_s.lstrip
      elsif x % 7 == 0
        x.to_s.rjust(2) + new_line
      end
    end
    day2.join(" ")
  end


end
