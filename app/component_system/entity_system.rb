class EntitySystem
  def initialize(world)
    @world = world
  end
  def startup
    @processing = true
    CCMacros.CCLOG("EntitySystem Start")
  end
  def process_entities(entities, delta)
    entities.each do |entity|
      @world.entity_manager.get_behaviors(entity[:entity]).each do |behavior|
        behavior[:behavior].update(delta)
      end
    end
  end
  def processing?
    @processing
  end


  def to_s
    "Entity_System"
  end
end