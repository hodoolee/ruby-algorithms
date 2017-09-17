class Array
  attr_accessor :array

  def initialize(array)
    @array = array
  end

  def quick_sort(p=0, r=array.size-1)
    if p < r
      q = partition(p, r)
      quick_sort(p, q-1)
      quick_sort(q+1, r)
    end
  end

  private

  def partition(p, r)
    x = array[r]
    i = p - 1

    (p..r-1).each do |j|
      if array[j] <= x
        i += 1
        array[i], array[j] = array[j], array[i]
      end
    end

    array[i+1], array[r] = array[r], array[i+1]

    return i + 1
  end
end
