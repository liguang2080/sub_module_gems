# -*- encoding : utf-8 -*-
class Time
  #used for Timezone insensitive comparisons
  def === t
    self.year == t.year &&
      self.month == t.month &&
      self.day == t.day &&
      self.hour == t.hour &&
      self.min == t.min &&
      self.sec == t.sec
  end


  def last_week
    self - 7.days
  end

  def next_week
    self + 7.days
  end

  def to_china
    self.to_s(:china)
  end

  def to_chinas
    self.to_s(:chinas)
  end
end
