
class Month

  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def to_s
    <<EOS
    #{m_name} #{year}
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31
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
      m_name[@month]
  end


end
