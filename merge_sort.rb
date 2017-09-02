def merge_sort(array)
	# base case
	return array if array.size == 1

	# find the middle point for recursvie calls of left and right array
	middle = array.size / 2

	# recursive calls
	array_left  = merge_sort(array[0...middle])
	array_right = merge_sort(array[middle...array.size])

	# merging steps 
  merge(array_left, array_right)
end

def merge(left, right)
	array_sorted = []
	
	# 왼쪽과 오른쪽의 첫번째 element를 비교하여
	# 작은 숫자부터 array_sorted에 추가한다.
	# 추가된 숫자는 해당 리스트에서 제거도니다.
	while left.any? && right.any?
		if left.first >= right.first
			array_sorted << right.shift
		else
			array_sorted << left.shift
		end
	end
	
	# 왼쪽과 오른쪽에 남은 숫자를 추가한다.
	array_sorted + left + right
end
