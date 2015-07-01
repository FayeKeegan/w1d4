
def eval_block(*arguments, &prc)
  if block_given?
    prc.call(arguments)
  else
    puts("NO BLOCK GIVEN!")
  end
end







class Array
  def my_each(&prc)
    n = 0
    until n == self.length
      prc.call(self[n])
      n += 1
    end
    self
  end

  def my_map(&prc)
    result = []
    self.my_each do |element|
      result << prc.call(element)
    end
    result
  end

  def my_select(&prc)
    result = []
    self.my_each do |element|
      if prc.call(element)
        result << element
      end
    end
    result
  end

  def my_inject(&prc)
    cumulator = self[0]
    self.drop(1).my_each do |element|
      cumulator = prc.call(cumulator, element)
    end
    cumulator
  end

  def my_sort!(&prc)
    self.length.times do
      (0...self.length).to_a.my_each do |index|
        if prc.call(self[index], self[index+1]) == 1
          self[index], self[index+1] = self[index+1], self[index]
        end
      end
    end
    self
  end
end
