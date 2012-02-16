# -*- encoding : utf-8 -*-
class Hash

  # hash取值 的时候先取符号号的，再取字符串   设置值的时候设成符号key
  def method_missing(method, *params)
    method_string = method.to_s
    if method_string.last == "="
      self[method] = params.first
    else
      self[method] || self[method_string]
    end
  end
  
end
