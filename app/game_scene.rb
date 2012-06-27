class GameScene < CCScene

  # def init
  #   super
  #   # super.tap do |me|
  #   #   me.addChild( BackgroundMapLayer.node, z: 0 )
  #   #   me.addChild( GameplayLayer.node, z: 5)
  #   #   me.addChild( InterfaceLayer.node, z: 10)
  #   # end
  # end

  def onEnter
    super
    CCMacros.CCLOG("Scene onEnter")
    @world = World.instance
    @system_manager = @world.system_manager
    @entity_manager = @world.entity_manager

    @background_map_layer = addChild( BackgroundMapLayer.node, z: 0 )
    @gameplay_layer = addChild( GameplayLayer.node, z: 5)
    @interface_layer = addChild( InterfaceLayer.node, z: 10)

    # @test_sprite_batch_node = CCSpriteBatchNode.batchNodeWithFile("human_avatar.png")
    # @gameplay_layer.addChild(@test_sprite_batch_node, z:0, 1001)

    @screen_size = CCDirector.sharedDirector.winSize

    30.times.each {

      x = Random.rand(@screen_size.width)
      y = Random.rand(@screen_size.height)
      position = CGPointMake(x, y)
      velocity = CGPointMake(Random.rand(200) - 100, Random.rand(200) - 100)

      entity = @entity_manager.create
      attribute = SpriteAttribute.new( entity, position, velocity, "human_avatar.png")
      entity.add_attribute( attribute )
      entity.add_behavior( SpriteBehavior.new( entity, [attribute], @gameplay_layer) )

    }

    test_entity = @entity_manager.active_entities.first
    test_attribute = @entity_manager.get_attribute_by_type(test_entity,"SpriteAttribute")
    #CCMacros.CCLOG(test_attribute)

    scheduleUpdate
  end

  def update(delta)
    @entity_manager.active_entities.each do |entity|
      sprite_attr = @entity_manager.get_attribute_by_type(entity,"SpriteAttribute")
      sprite_attr.position = CGPointMake(sprite_attr.position.x + sprite_attr.velocity.x * delta, sprite_attr.position.y + sprite_attr.velocity.y * delta)
    end
    @system_manager.update_systems(delta)
  end

end