class EntityManager
  attr_reader :active_entities, :entity_attributes, :entity_behaviors
  def initialize(world)
    @world = world
    @active_entities = Array.new
    @entity_attributes = Array.new
    @entity_behaviors = Array.new
    @next_available_id = 0
    puts "EntityManager init"
  end

  #entities

  def create
    entity = Entity.new(@world, @next_available_id)
    @active_entities.push( {entity_id: entity.id, entity: entity} )
    @next_available_id += 1
    entity
  end
  def remove(entity)
    @active_entities[entity.id] = nil
    remove_attributes_from_entity(entity)
  end
  def entity(entity_id)
    entity = @active_entities.find do |e|
      e[:entity_id] == entity_id
    end
    entity[:entity]
  end

  #attributes

  def add_attribute(entity, attribute)
    @entity_attributes.push( {entity_id: entity.id, attribute: attribute} )
  end
  def remove_attributes(entity)
    @entity_attributes.delete_if do |a|
      a[:entity_id] == entity.id
    end
  end
  def remove_attribute(entity, attribute)
    @entity_attributes.delete_if do |a|
      a[:entity_id] == entity.id && a[:attribute] == attribute
    end
  end
  def remove_attribute_by_type(entity, attribute_class)
    @entity_attributes.delete_if do |a|
      a[:entity_id] == entity.id && a[:attribute].class.to_s == attribute_class
    end
  end
  def get_attributes(entity)
    @entity_attributes.select do |a|
      a[:entity_id] == entity.id
    end
  end
  def get_attribute_by_type(entity, attribute_class)
    att = @entity_attributes.find do |a|
      a[:entity_id] == entity[:entity].id && a[:attribute].class.to_s == attribute_class
    end
    att[:attribute]
  end

  #behaviors

  def add_behavior(entity, behavior)
    @entity_behaviors.push( {entity_id: entity.id, behavior: behavior} )
  end
  def remove_behaviors(entity)
    @entity_behaviors.delete_if do |b|
      b[:entity_id] == entity.id
    end
  end
  def remove_behavior(entity, behavior)
    @entity_behaviors.delete_if do |b|
      b[:entity_id] == entity.id && b[:behavior] == behavior
    end
  end
  def remove_behavior_by_type(entity, behavior_class)
    @entity_behaviors.delete_if do |b|
      b[:entity_id] == entity.id && b[:behavior].class.to_s == behavior_class
    end
  end
  def get_behaviors(entity)
    @entity_behaviors.select do |b|
      b[:entity_id] == entity.id
    end
  end
  def get_behavior_by_type(entity, behavior_class)
    att = @entity_behaviors.find do |b|
      b[:entity_id] == entity.id && b[:behavior].class.to_s == behavior_class
    end
    att[:behavior]
  end



  def to_s
    "Entity_Mgr"
  end

end