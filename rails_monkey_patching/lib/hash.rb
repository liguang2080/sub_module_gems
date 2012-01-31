class Hash

  # hash对方法的处理是以字符串为准,　不是符号
  def method_missing(method, *params)
    method_string = method.to_s
    if method_string.last == "="
      self[method_string[0..-2]] = params.first
    else
      self[method_string] || self[method]
    end
  end
  
end