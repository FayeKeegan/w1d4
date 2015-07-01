#Problem 1: You have array of integers. Write a recursive solution to find
#the sum of the integers.

def sum_recur(array)
  if array.length == 0
    0
  else
    first_num = array[0]
    first_num + sum_recur(array.drop(1))
  end
end


#Problem 2: You have array of integers. Write a recursive solution to
#determine whether or not the array contains a specific value.

def includes?(array, target)
  if array.length == 0
    false
  else
    array[0] == target || includes?(array.drop(1), target)
  end
end


#Problem 3: You have an unsorted array of integers. Write a recursive
#solution to count the number of occurrences of a specific value.

def num_occur(array, target)
  if array.length == 0
    0
  else
    (array[0] == target ? 1 : 0) + num_occur(array.drop(1), target)
  end
end


#Problem 4: You have array of integers. Write a recursive solution to
#determine whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)
  if array.length < 2
    false
  else
    first_two_sum = array[0] + array[1]
    first_two_sum == 12 ? true : add_to_twelve?(array.drop(1))
  end
end


#Problem 5: You have array of integers. Write a recursive solution to
#determine if the array is sorted.

def sorted?(array)
  if array.length < 2
    true
  else
    first_diff = array[1] - array[0]
    if first_diff >= 0
      sorted?(array.drop(1))
    else
      false
    end
  end
end


#Problem 6: Write the code to give the value of a number after it is
#reversed. Must use recursion. (Don't use any #reverse methods!)

def reverse(number)
  if number < 10
    number
  else
    number = number.to_s
    (reverse(number[1..-1].to_i).to_s+number[0]).to_i
  end
end

31 -> 13

3 + (1)*10


251 -> 152

2 + 10*(5*10*(1))
