class Date
  def last_week
    self - 7
  end

  def next_week
    self + 7
  end

  def self.month_days(month,year = Date.today.year)
    mdays = [nil,31,28,31,30,31,30,31,31,30,31,30,31]
    mdays[2] = 29 if Date.leap?(year)
    mdays[month]
  end
end
