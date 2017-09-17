def balanced_parens?(string)
	opener = []
	parens_map = {
		'(' => ')',
		'[' => ']',
		'{' => '}'
	}

	i = 0
  while i < string.length
    # if current char is opener then add to array
    if parens_map.keys.include? string[i]
      opener << string[i]
    # if closer then pop out
    elsif parens_map.values.include? string[i]
      popped_paren = opener.pop
      # checking if closer at current index matches for last opener
      return false if string[i] != parens_map[popped_paren]
    end
    i += 1
  end
  # if opener is empty, return true
	# beacuse all parens match
  opener.empty?
end
