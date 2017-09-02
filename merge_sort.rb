def merge_sort(array)
  # base case
  return array if array.size == 1

  # find the middle point
  middle = array.size / 2

  # recursive calls
  array_left  = merge_sort(array[0...middle])
  array_right = merge_sort(array[middle...array.size])

  # merging steps 
  merge(array_left, array_right)
end

def merge(left, right)
  array_sorted = []
  
    # compare first elements of each left and right array
    # smaller gets pushed to array_sorted and removed from the array  while left.any? && right.any?
    if left.first >= right.first
      array_sorted << right.shift
    else
      array_sorted << left.shift
    end
  end

  # add left elements to array_sorted
  array_sorted + left + right
end
