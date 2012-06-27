class Attribute
  attr_reader :value
  def initialize(entity, value)
    @entity = entity
    @value = value
  end
  def value
    @value
  end
  def value=(val)
    @value = val
  end
  def to_s
    "Attr(Entity_#{@entity.id})"
  end
end