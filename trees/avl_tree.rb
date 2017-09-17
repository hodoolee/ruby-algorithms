class AVLTree
  class Node
    attr_reader :value, :left, :right

    def initialize(value)
      @value = value
      @left = nil
      @right = nil
    end

    def insert(v)
      case @value <=> v
      when -1 # insert into right subtree
        @right.nil? ? @right = Node.new(v) : @right.insert(v)
      when 1  # insert into left subtree
        @left.nil? ? @left = Node.new(v) : @left.insert(v)
      end
    end
  end

  def initialize(v)
    @root = Node.new(v)
  end

	def insert(v)
		@root.insert(v)
	end

  def is_balanced?(node=@root)
    h_left  = get_height(node.left)
    h_right = get_height(node.right)
    h_diff = h_left - h_right

    return h_diff.abs > 1 ? false : true
  end

  def get_height(node=@root)
    return 0 if node.nil? # base case

    h_left = get_height(node.left)
    h_right = get_height(node.right)

    return [h_left, h_right].max + 1
  end
end

# Create an AVL Tree
avl_tree = AVLTree.new(10)
avl_tree.insert(5)
avl_tree.insert(15)

puts avl_tree.get_height   
puts avl_tree.is_balanced? 
puts avl_tree.inspect
