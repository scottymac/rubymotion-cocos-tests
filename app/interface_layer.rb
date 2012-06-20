class InterfaceLayer < CCLayer

  def init
    super.tap do |me|
      me.isTouchEnabled = true
      label = CCLabelTTF.labelWithString( "UI Layer", fontName:"Helvetica", fontSize:24 )
      label.anchorPoint = CGPointMake(0,0)
      label.position =  CGPointMake(5,5)
      me.addChild label
    end
  end

  def ccTouchesBegan (touches, withEvent:event)
    CCMacros.CCLOG("TOUCHED")
    # tileMap = self.getChildByTag ("25")
    # touchLocation = self.locationFromTouch (touches.anyObject)
    # tilePos = self.tilePosFromLocation (touchLocation, tileMap:tileMap)
    # self.centerTileMapOnTileCoord (tilePos, tileMap:tileMap)
  end

end
