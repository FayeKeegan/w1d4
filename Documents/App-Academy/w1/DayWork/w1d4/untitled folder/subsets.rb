class Array
  def subsets
    if self.length == 0
      [[]]
    else
      last_thing = self.pop
      former_sets = self.subsets
      other_sets = former_sets.map { |this_set| this_set + [last_thing]}
      (former_sets + other_sets).map(&:sort).sort
    end
  end

end
