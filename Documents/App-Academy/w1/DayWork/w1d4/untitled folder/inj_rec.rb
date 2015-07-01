class Array
  def recursive_inject(&prc)
    if self.length == 1
      return self[0]
    else
      prc.call(self[0], self[1..-1].recursive_inject(&prc))
    end
  end

end
