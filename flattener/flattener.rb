class Flattener
  class << self
    #recursive
    def flatten(arr)
      return "I shant flatten anything other than an array" if !arr.is_a?(Array)
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
