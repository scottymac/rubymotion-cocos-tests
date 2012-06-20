class BackgroundMapLayer < CCNode

  def init
    super.tap do |l|
      tileMap = CCTMXTiledMap.tiledMapWithTMXFile("my-map.tmx")
      @tileMapHeightInPixels = tileMap.mapSize.height * tileMap.tileSize.height / CCMacros.CC_CONTENT_SCALE_FACTOR
      @tileMapWidthInPixels = tileMap.mapSize.width * tileMap.tileSize.width / CCMacros.CC_CONTENT_SCALE_FACTOR
      l.addChild(tileMap, z:-1, tag:25)
      CCMacros.CCLOG("Tilemap Size: #{@tileMapWidthInPixels} x #{@tileMapHeightInPixels}")
    end
  end

  def onEnter
    super
  end

  def ccTouchesBegan (touches, withEvent:event)
    tileMap = self.getChildByTag ("25")
    touchLocation = self.locationFromTouch (touches.anyObject)
    tilePos = self.tilePosFromLocation (touchLocation, tileMap:tileMap)
    self.centerTileMapOnTileCoord (tilePos, tileMap:tileMap)
  end

  def locationFromTouch (touch)
    touchLocation = touch.locationInView (touch.view)
    return CCDirector.sharedDirector.convertToGL (touchLocation)
  end

  def tilePosFromLocation (location, tileMap:tileMap)

    pos = CGPointMake(location.x - tileMap.position.x, location.y - tileMap.position.y)

    scaledWidth = tileMap.tileSize.width / CCMacros.CC_CONTENT_SCALE_FACTOR
    scaledHeight = tileMap.tileSize.height / CCMacros.CC_CONTENT_SCALE_FACTOR

    pos.x = (pos.x / scaledWidth)
    pos.y = ((tileMap.mapSize.height * tileMap.tileSize.height - pos.y) / scaledHeight)

    return pos
  end

  def centerTileMapOnTileCoord (tilePos, tileMap:tileMap)

    # center tilemap on the given tile pos
    screenSize = CCDirector.sharedDirector.winSize
    screenCenter = CGPointMake(screenSize.width * 0.5, screenSize.height * 0.5)

    # tile coordinates are counted from upper left corner, this maps coordinates to lower left corner
    tilePos.y = (tileMap.mapSize.height - 1) - tilePos.y

    # point is now at lower left corner of the screen
    scrollPosition = CGPointMake(-(tilePos.x * tileMap.tileSize.width), -(tilePos.y * tileMap.tileSize.height))

    # offset point to center of screen and center of tile
    scrollPosition.x += screenCenter.x - tileMap.tileSize.width * 0.5
    scrollPosition.y += screenCenter.y - tileMap.tileSize.height * 0.5

    # make sure tilemap scrolling stops at the tilemap borders
    scrollPosition.x = NumberUtilities.limit(scrollPosition.x, -@tileMapWidthInPixels + screenSize.width, 0)
    scrollPosition.y = NumberUtilities.limit(scrollPosition.y, -@tileMapHeightInPixels + screenSize.height, 0)

    # CCMacros.CCLOG("tilePos: (#{tilePos.x}, #{tilePos.y}) moveTo: (#{scrollPosition.x}, #{scrollPosition.y})")

    move = CCMoveTo.actionWithDuration (0.2, position:scrollPosition)
    tileMap.stopAllActions
    tileMap.runAction (move)

  end


end
