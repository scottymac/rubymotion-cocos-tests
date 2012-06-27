class Behavior
  def initialize(entity, attributes=[])
    @entity = entity
    @attributes = attributes
  end
  #messaging

  def update(delta)
  end

  def get_attribute(attribute_class)
    att = @attributes.find do |a|
      a.class.to_s == attribute_class
    end
    att
  end

  def to_s
    "Beh(Entity_#{@entity.id})"
  end

end