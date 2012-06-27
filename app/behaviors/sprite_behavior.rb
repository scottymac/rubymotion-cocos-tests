class SpriteBehavior < Behavior
  def initialize(entity, attributes, parent_layer)
    @entity = entity
    @attributes = attributes
    @sprite = CCSprite.spriteWithFile( get_attribute("SpriteAttribute").filename )
    @sprite.setPosition ( get_attribute("SpriteAttribute").position )
    parent_layer.addChild @sprite
  end

  def update(delta)
    check_bounds
    @sprite.setPosition( get_attribute("SpriteAttribute").position )
  end

  def check_bounds
    sprite_attr = get_attribute("SpriteAttribute")
    screenSize = CCDirector.sharedDirector.winSize
    rect = @sprite.boundingBox
    if (rect.origin.x + rect.size.width) >= screenSize.width
      sprite_attr.velocity.x = -sprite_attr.velocity.x.abs
      sprite_attr.position.x = sprite_attr.position.x - 2
    elsif rect.origin.x <= 0
      sprite_attr.velocity.x = sprite_attr.velocity.x.abs
      sprite_attr.position.x = sprite_attr.position.x + 2
    end
    if (rect.origin.y + rect.size.height) >= screenSize.height
      sprite_attr.velocity.y = -sprite_attr.velocity.y.abs
      sprite_attr.position.y = sprite_attr.position.y - 2
    elsif rect.origin.y <= 0
      sprite_attr.velocity.y = sprite_attr.velocity.y.abs
      sprite_attr.position.y = sprite_attr.position.y + 2
    end
  end

  def outside_screen_area?
    screenSize = CCDirector.sharedDirector.winSize
    screenRect = CGRectMake(0, 0, screenSize.width, screenSize.height)
    CGRectContainsRect(screenRect, @sprite.boundingBox) ? false : true
  end

end