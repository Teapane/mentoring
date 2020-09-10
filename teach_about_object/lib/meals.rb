class Meals
  attr_reader :appetizers, :entrees, :drinks

  def initialize(attrs)
    @appetizers = attrs[:appetizers]
    @entrees = attrs[:entrees]
    @drinks = attrs[:drinks]
  end
end
