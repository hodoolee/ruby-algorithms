class PriorityQueue
  attr_accessor :queue

	def initialize
    @queue = [nil]
  end

  # element should be inserted in the right place
  def <<(element)
    @queue << element

    bubble_up(@queue.size - 1)
  end

  def pop
    # exchange first and last elements
    @queue[1], @queue[@queue.size - 1] = 
      @queue[@queue.size - 1], @queue[1]

    # remove the last element from the queue
    result = @queue.pop

    # recursive call
    bubble_down(1)
    
    return result
  end

  private 
		
  	# exchange the elements if current element at index
    # is smaller than it's parent
    def bubble_up(index)
      parent_index = (index / 2)

      # base cases
      return if index == 1
      return if @queue[parent_index] >= @queue[index]

      # exchange elements
      @queue[index], @queue[parent_index] = @queue[parent_index], @queue[index]

      # recursive call
      bubble_up(parent_index)
    end
    

    def bubble_down(index)
      child_index = (index * 2)

      return if child_index > @queue.size - 1

      child_left = @queue[child_index]
      child_right = @queue[child_index + 1]
			
			# if both children not empty then
			# compare left and right
			if child_left != nil && child_right != nil
			  child_index += 1 if child_right > child_left
			# if left child is nil then right child is selected
      # no need to check if child_right is nil
      # since child_index is already pointing to left child
			elsif child_left.nil?
				child_index += 1
			end

      # if current is bigger then return
      # else excahnge and bubble down again
      if @queue[index] >= @queue[child_index]
        return
      else
        @queue[index], @queue[child_index] = @queue[child_index], @queue[index]
        bubble_down(child_index)
      end
    end
end

