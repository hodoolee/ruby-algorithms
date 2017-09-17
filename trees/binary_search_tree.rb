class BinarySearchTree
  class Node
    attr_reader :value, :left, :right

    def initialize(value)
      @value = value
      @left = nil
      @right = nil
    end

    def insert(value)
      case value <=> @value
      when 1
        @right.nil? ? @right = Node.new(value) : @right.insert(value)
      when -1
        @left.nil? ? @left = Node.new(value) : @left.insert(value)
      end
    end
  end

  def initialize(value)
    @root = Node.new(value)
  end

  def print_inorder(node=@root)
    return if node.nil? # base case
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
