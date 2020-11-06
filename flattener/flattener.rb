class Flattener
  class << self
    #recursive
    def flatten(arr)
      non_nil = arr.reject { |x| x.nil? }
      non_nil.reduce([]) do |acc, item|
        if array?(item)
          acc + flatten(item)
        else
          acc << item
        end
      end
    end

    def array?(arr)
      arr.is_a?(Array)
    end
  end
end
