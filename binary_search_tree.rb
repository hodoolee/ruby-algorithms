class BinarySearchTree
  class Node
    attr_reader :value, :left, :right

    def initialize(value)
      @value = value
      @left = nil
      @right = nil
    end

    def insert(new_value)
      case new_value <=> @value
      when 1
        @right.nil? ? @right = Node.new(new_value) : @right.insert(new_value)
      when -1
        @left.nil? ? @left = Node.new(new_value) : @left.insert(new_value)
      end
    end
  end

  def initialize(v)
		@root = Node.new(v)
  end

  def print_inorder(node=@root)
    return if node.nil? # base case
  end

  def check_height(node)
    return 0 if node.nil?

    leftHeight = check_height(node.left)
    return -1 if leftHeight == -1

    rightHeight = check_height(node.right)
    return -1 if rightHeight == -1

    diff = leftHeight - rightHeight
    if diff.abs > 1
      -1
    else
      [leftHeight, rightHeight].max + 1
    end
  end

  def is_balanced?(node=@root)
    check_height(node) == -1 ? false : true
  end

  def search(value, node=@root)
    return false if node.nil? # base case

    case node.value <=> value
    when 0  then true
    when -1 then search(value, node.right)
    when 1  then search(value, node.left)
    end
  end
	    
end
