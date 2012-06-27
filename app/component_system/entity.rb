class Entity
  attr_reader :id
  def initialize(world, id)
    @world = world
    @id = id
    @entityManager = @world.entity_manager
  end

  def add_attribute(attribute)
    @entityManager.add_attribute(self, attribute)
  end
  def attributes
    @entityManager.get_attributes(self)
  end
  def attribute(attribute_class)
     @entityManager.get_attribute_by_type(self, attribute_class)
  end

  def add_behavior(behavior)
    @entityManager.add_behavior(self, behavior)
  end
  def behaviors
    @entityManager.get_behaviors(self)
  end
  def behavior(behavior_class)
     @entityManager.get_behavior_by_type(self, behavior_class)
  end

  def to_s
    "#{self.class}_#{@id}"
  end
end