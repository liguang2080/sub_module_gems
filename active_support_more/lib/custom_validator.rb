def should_be_have(obj)
  obj.present?
end

def should_be_number(obj)
  should_be_have(obj) && ((obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil) ? false : true)
end

def should_greater_than_zero(obj)
  should_be_have(obj) && should_be_number(obj) && (obj.to_s.to_f > 0)
end

def should_greater_than_or_equal_zero(obj)
  should_be_have(obj) && should_be_number(obj) && (obj.to_s.to_f >= 0)
end