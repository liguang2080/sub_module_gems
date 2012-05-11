# -*- encoding : utf-8 -*-
class NilClass
  
  def each
    nil
  end
  
  def dup
    nil
  end
  
  def to_hash
    {}
  end
end
