
require_relative 'month'

class Year

  attr_reader :year

  MONTH = ['January','February','March','April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']

  def initialize(year)
    @year = year
  end

  def get_year
    "#{year}".to_s.center(52).rstrip + "\n"
  end

  def year_cal
    <<EOS
#{get_year}
#{build_month}
EOS
  end

  def build_month
    year_months = []
    months = ''
    (1..12).each do |month|
      m = Month.new(month, year).to_s.split("\n")
      year_months << m
    end

    year_months.each_slice(3) do |triple|
       months << "#{triple[0][0][0...-5].lstrip.center(15)}  #{triple[1][0][0...-5].lstrip.center(25)}  #{triple[2][0][0...-5].lstrip.center(12).rstrip}\n"
       months << "#{triple[0][1]}  #{triple[1][1]}  #{triple[2][1]}\n"
       months << "#{triple[0][2]}  #{triple[1][2]}  #{triple[2][2]}\n"
       months << "#{triple[0][3]}  #{triple[1][3]}  #{triple[2][3]}\n"
       months << "#{triple[0][4]}  #{triple[1][4]}  #{triple[2][4]}\n"
       months << "#{triple[0][5]}  #{triple[1][5]}  #{triple[2][5]}\n"
       months << "#{triple[0][6].ljust(20)}  #{triple[1][6].ljust(20)}  #{triple[2][6].ljust(20)}\n"
       if triple[0][7]
         triple[1][7] = "                    "
         triple[2][7] = "                    "
         months << "#{triple[0][7]}  #{triple[1][7]}  #{triple[2][7]}\n"
       elsif triple[1][7]
         triple[0][7] = "                    "
         triple[2][7] = "                    "
        months << "#{triple[0][7]}  #{triple[1][7]}  #{triple[2][7]}\n"
       elsif triple[2][7]
         triple[0][7] = "                    "
         triple[1][7] = "                    "
        months << "#{triple[0][7]}  #{triple[1][7]}  #{triple[2][7]}\n"
      elsif triple[0][7].nil? && triple[1][7].nil? && triple[2][7].nil?
        months << "\n"
       end
    end
    months
  end

end
