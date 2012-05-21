# -*- encoding : utf-8 -*-
class Fixnum
  def roundf(places)
    temp = self.to_s.length
    sprintf("%#{temp}.#{places}f",self).to_f
  end
  
  def to_see_zero?
    true
  end
  
  def to_chinese
    if self >= 10000
      (self / 10000).to_s + "万"
    else
      self
    end
  end
end

class Float

  def roundf(places)
    temp = self.to_s.length
    sprintf("%#{temp}.#{places}f",self).to_f
  end

  def round2
    whole = self.floor
    fraction = self - whole
    if fraction == 0.5
      if (whole % 2) == 0
        whole
      else
        whole+1
      end
    else
      self.round
    end
  end

  def roundf2(places)
    shift = 10**places
    (self * shift).round2 / shift.to_f
  end
  
  def round_cut(places)
    shift = 10**places
    (self * shift).to_i / shift.to_f
  end
  
  def to_see_zero?
    self < 0.00001 ? true : false
  end

end
