class Artist
  attr_reader :id, :born, :died, :name, :country
  # probably shouldn't do this...but metaprogramming is fun!
  def initialize(args)
    args.each do |key, value|
      instance_variable_set("@#{key}", value) unless value.nil?
    end
  end
end
