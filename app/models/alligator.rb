class Alligator
  attr_reader :name
  attr_reader :specie

  def initialize name
    @name = name
  end

  def initialize name
    @specie = specie
  end

  def == other
    other.is_a?(Alligator) && other.name == name && other.specie == specie
  end
end