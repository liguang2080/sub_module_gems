class Array

  def rand
    self[Object.send('rand', size)]
  end


  # [[1, 100], [2, -50], [3, 75], [4, -25]] => [[1, 25], [3, 75]]
  # [[1, 100], [2, -50], [3, 75], [4, -100]] => [[3, 25]]
  def collapse
    result_hash = ActiveSupport::OrderedHash.new { |k,v| k[v] = 0 }
    each do |k, v|
      next if (v.blank?  || v == 0)
      if v > 0
        result_hash[ k ] += v
      end
      if v < 0
        abs_v = v.abs #有多少份额赎回，要从前的的所有申购记录中剔除
        result_hash.each do |k2, v2|
          if v2 >= abs_v #也就是赎回的是某一次所有的申购
            result_hash[k2] = v2 - abs_v
            break
          else
            abs_v = abs_v - v2
            result_hash[ k2 ] = 0
          end
        end
      end

    end

    result_hash.reject! {|k, v| v == 0}
    result_hash.to_a
  end

  # 二维数组里面进行互相交叉
  def intersection
    base = self.first
    self.each do |item|
      base = base & item
    end
    return [] if base.nil?
    base
  end

  #　两个数组进行累计乘积 ([1,2,3]).cross([2,3,4]) => 1 * 2 + 2 * 3 + 3 * 4 => 20
  def cross(array)
    return 0 if self.length != array.length
    sum = 0
    self.each_with_index do |item, i|
      sum += item * array[i]
    end
    sum
  end

  def odd_values
    array2 = []
    each_with_index do |item,index|
      array2.push(item) if (index % 2 == 1)
    end
    array2
  end

  def even_values
    array2 = []
    each_with_index do |item,index|
      array2.push(item) if (index % 2 == 0)
    end
    array2
  end

  # 把一个二维数据转成order hash
  def to_order_hash
    hash = ActiveSupport::OrderedHash.new
    each do |key, value|
      hash[key] = value
    end
    hash
  end
end
