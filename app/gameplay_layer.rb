class GameplayLayer < CCNode

  def init
    super.tap do |me|
      screenSize = CCDirector.sharedDirector.winSize
      @avatarSprite = CCSprite.spriteWithFile("human_avatar.png")
      screenCenter = CGPointMake(screenSize.height * 0.5, screenSize.width * 0.5)
      @avatarSprite.setPosition( screenCenter )
      me.addChild @avatarSprite
      CCMacros.CCLOG("x: #{screenCenter.x}, y: #{screenCenter.y}")
    end
  end


end
