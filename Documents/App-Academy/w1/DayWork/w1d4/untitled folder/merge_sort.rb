class Array

  def merge_sort
    if self.length < 2
      self
    else
      mid_i = self.length/2
      first_half = self[0...mid_i].merge_sort
      second_half = self[mid_i..-1].merge_sort
      first_half.merge(second_half)
    end
  end

  def merge(other)
    if self.empty?
      other
    elsif other.empty?
      self
    elsif self[0] > other[0]
      [other[0]] + self.merge(other.drop(1))
    else
      [self[0]] + self.drop(1).merge(other)
    end
  end
end






# [1,3,5,6,7].merge([2,4,8])
#
# [1] + [3,5,6,7].merge([2,4,8])
# [1] + [2] + [3,5,6,7].merge(4,8)
