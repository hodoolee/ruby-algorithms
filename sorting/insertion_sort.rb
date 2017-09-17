def insertion_sort(array)
	(j=1..array.size-1).each do |j|
		key = array[j] # temp value
		i = j-1
		while i>=0 && array[i] > key
			# swap
			array[i+1] = array[i]
			i -=1
		end
		array[i+1] = key
	end
	return array
end
