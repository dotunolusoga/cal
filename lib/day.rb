

class Day

  attr_reader :month, :year

  #h is the day of the week (0 = Saturday, 1 = Sunday, 2 = Monday, ..., 6 = Friday)
  #q is the day of the month
  #m is the month (3 = March, 4 = April, 5 = May, ..., 14 = February)

  def initialize(month, year)
    @month = month
    @year = year
  end

  def zellers
    mth = month
    y = year

    mth = 13 if month == 1
    mth = 14 if month == 2
    y = year - 1 if mth > 12
    q = 1 
    week_start_day = ( q + (((mth + 1) * 26)/10) + y + (y/4) + (6*(y/100)) + (y/400)) % 7
    if week_start_day == 0
      week_start_day = 7
    else
      week_start_day = week_start_day
    end
  end

end
