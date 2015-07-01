def make_dumb_change(total, coins)
  if total == 0 then return [] end
  coins = coins.sort.reverse
  possible_total = total - coins[0]
  if possible_total < 0
    make_dumb_change(total, coins[1..-1])
  else
    make_dumb_change(possible_total, coins) << coins[0]
  end
end

def make_change(total, coins)
  # if total == 0 then return [] end
  return [] if total == 0
  possible_change = []
  shortest_change = total
  best_result = []

  coins.each_with_index do |coin, index|
    # next if coin > total
    possible_total = total - coin
    if possible_total < 0
      possible_result = make_change(total, coins[index + 1..-1])
    else
      possible_result = make_change(possible_total, coins[index..-1]) << coin
    end

    if possible_result.length < shortest_change
      shortest_change = possible_result.length
      best_result = possible_result
    end
  end

  best_result
end







def range_iter(start_val, end_val)
  result = []
  while start_val < end_val
    result << start_val
    start_val +=1
  end
  result
end

def range_rec(start_val, end_val)
  if start_val >= end_val
    []
  else
    [start_val] + range_rec(start_val+1, end_val)
  end
end

def exp_1(base, power)
  power == 0 ? 1 : base * exp_1(base, power-1)
end

def exp_better(base, power)
  if power == 0
    1
  elsif power == 1
    base
  elsif power % 2 == 0
    x = exp_better(base, power/2 )
    x * x
  else
    base * exp_better(base, power - 1)
  end
end

def fib(n)
  if n == 0
    0
  elsif n == 1
    1
  else
    fib(n-1) + fib(n-2)
  end
end


def fib_nums(n)
  if n == 0
    [0]
  elsif n == 1
    [0, 1]
  else
    previous = fib_nums(n-1)
    previous << previous[-1] + previous[-2]
  end
end

def bsearch(array, num)
  middle_idx = array.length / 2
  if array[middle_idx] > num
    bsearch(array.slice(0...middle_idx), num)
  elsif array[middle_idx] < num
    middle_idx + 1 + bsearch(array.slice(middle_idx+1...array.length), num)
  else
    middle_idx
  end
end



class Array

  def deep_dup
    if self.all? {|elem| elem.class != Array}
      self.dup
    else
      self.map {|array| array.deep_dup}
    end
  end
end
