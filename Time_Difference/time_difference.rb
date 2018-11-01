def my_min(list) # n^2  
  small = true
  list.each do |el| # n
    list.each do |el2| # n
      if el > el2
        small = false
      end
    end
    if small == true
      return el
    else
      small = false
    end
    
    small = true
  end
end

def my_min2(list) # n
  smallest = list.first # 1

  list.each do |el| # n
    smallest = el if smallest > el # 1
  end
  
  smallest 
end


def sub_sum(array) #n^3
  sum = 0
  subarrays(array).each do |arr| #n
    sum = arr.reduce(:+) if arr.reduce(:+) > sum #1
  end
  
  sum
end

def subarrays(array) # n^3
  sub_arr = [] #1
  holder_arr = [] # 1
  
  array.each_with_index do |num1, idx1| #n
    sub_arr << [num1] #1
    holder_arr = [num1] # 1
    array.each_with_index do |num2, idx2|#n
      next if idx2 <= idx1 #1
      holder_arr += [num2] # 1
      sub_arr << holder_arr # 1
    end
  end

  sum = sub_arr[0].reduce(:+)
  
  sub_arr.each do |arr| # n
    sum = arr.reduce(:+) if arr.reduce(:+) > sum
  end
  sum
end
require 'byebug'
def better_subarrays(array)
  sum = array.first
  current_sum = array.first
  
  (1...array.length).each do |idx|
    current_sum = 0 if current_sum < 0
    current_sum += array[idx]
    sum = current_sum if current_sum > sum
  end
  
  sum
end
