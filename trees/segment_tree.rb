class SegmentTree
  attr_reader :value, :data

  def initialize(data)
    @data = data.empty? ? [0] : data

		node_count = (2 ** Math.log(@data.count, 2).to_i + 1) - 1
    @value = [0]*node_count

		# build segment tree
    build(0, 0, data.count-1)
  end

	def query(q_low, q_high)
    recur_query(0, 0, data.count-1, q_low, q_high)
  end

  private
    def build(node, low, high)
      if low == high
        value[node] = data[low]
				return value[node]
      end

      mid = (low+high)/2

			left = build(2*node+1, low, mid)
			right = build(2*node+2, mid+1, high)

		  value[node] = [left, right].min
			return value[node]
    end

		def recur_query(node, low, high, q_low, q_high)
			# no overlap
			if q_low > high or q_high < low
        return Float::INFINITY
      end

			# total overlap
			if q_low <= low && high <= q_high
        return value[node]
      end

			# partial overlap
			mid = (low+high)/2
      left  = recur_query(2*node+1, low, mid, q_low, q_high)
      right = recur_query(2*node+2, mid+1,high, q_low, q_high)

			return [left, right].min
    end
end

array = [-1, 2, 4, 0]
seg_tree = SegmentTree.new(array)
p seg_tree.value
p seg_tree.data
p seg_tree.query(0, 3)
