class Numeric

  def to_clock
    ret = ''
    total = self.to_s.to_i #so we don't change self
    if total >= 1.hour
      num = (total / 1.hour.to_f).floor
      total -= num * 1.hour
      ret += num.to_s
    else
      ret = '00'
    end
    if total >= 1.minute
      num = (total / 1.minute.to_f).floor
      total -= num * 1.minute
      ret += ':' + num.to_s.rjust(2, '0')
    else
      ret += ':00'
    end
    if total < 1.minute
      num = total
      ret += ':' + num.to_s.rjust(2, '0')
    else
      ret += ':00'
    end

    ret
  end

  def to_local_week_day(padding = "周")
    case self.to_i
    when 0
      "#{padding}天"
    when 1
      "#{padding}一"
    when 2
      "#{padding}二"
    when 3
      "#{padding}三"
    when 4
      "#{padding}四"
    when 5
      "#{padding}五"
    when 6
      "#{padding}六"
    else
      ""
    end
  end

end
