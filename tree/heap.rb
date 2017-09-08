def max_heapify(array, i)
  l = (2*i)
  r = (2*i)+1
	
  # we should subtract since given array includes 'nil' at position 0
  heap_size = array.size - 1

  # l <= heap_size condition ensures that the left child exists
  if l <= heap_size && array[l] > array[i]
    largest = l
  else
    largest = i
  end

  # r <= heap_size condition ensures that the right child exists
  if r <= heap_size && array[r] > array[largest]
    largest = r
  end

  # if root is the largest then no need to exchange
  if largest != i
    array[i], array[largest] = array[largest], array[i]
    max_heapify(array, largest)
  end
	
  return array
end

def build_max_heap(array)
  # array.size / 2 => last index of non-leaf
  # leaf starts at the index of floor(array.size / 2) + 1
	(array.size/2).downto(1).each do |i|
    max_heapify(array, i)
  end

  return array
end

array = [nil, 5, 10, 1, 20, 3, 11, 100]
p build_max_heap(array) # => [nil, 100, 20, 11, 10, 3, 5, 1]
