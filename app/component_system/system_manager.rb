class SystemManager
  def initialize(world)
    @world = world
    @systems = Array.new
    entity_system = EntitySystem.new(world)
    @systems.push({ type: entity_system.class, system: entity_system })
    initialize_systems
  end
  def initialize_systems
    @systems.each do |s|
      s[:system].startup
    end
  end
  def update_systems(delta)
    #entities = @world.entity_manager.active_entities
    @systems.each do |s|
      s[:system].process_entities(@world.entity_manager.active_entities, delta)
    end
  end
end