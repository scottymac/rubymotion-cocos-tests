class World
  include Singleton
  attr_reader :system_manager, :entity_manager
  def init_managers
    @system_manager = SystemManager.new(self)
    @entity_manager = EntityManager.new(self)
    CCMacros.CCLOG("Init Managers")
  end
end