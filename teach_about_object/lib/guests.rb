class Guests

  attr_reader :name, :count, :allergies

  def initialize(attrs)
    @name = attrs[:name]
    @count = attrs[:count]
    @allergies = attrs[:allergies]
  end
end
