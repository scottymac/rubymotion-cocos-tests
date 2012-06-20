class PanZoomLayer < CCLayer

  def self.scene
    CCMacros.CCLOG("Init PanZoomLayer")
    scene = CCScene.node 
    layer = PanZoomLayer.node
    scene.addChild layer
    scene
  end

  def init
    super.tap do |l|
      l.isTouchEnabled = true
      tileMap = CCTMXTiledMap.tiledMapWithTMXFile("my-map.tmx")
      @tileMapHeightInPixels = tileMap.mapSize.height * tileMap.tileSize.height / CCMacros.CC_CONTENT_SCALE_FACTOR
      @tileMapWidthInPixels = tileMap.mapSize.width * tileMap.tileSize.width / CCMacros.CC_CONTENT_SCALE_FACTOR

      panZoomLayer = CCLayerPanZoom.node
      panZoomLayer.delegate = self
      panZoomLayer.addChild(tileMap, z:0, tag:1)
      l.addChild(panZoomLayer, z:-1, tag:2)
      # CCMacros.CCLOG("Tilemap Size: #{@tileMapWidthInPixels} x #{@tileMapHeightInPixels}")
    end
  end

  def onEnter
    super
    # panZoomLayer = self.getChildByTag ("2")
    # panZoomLayer.maxScale = 1.0
    # panZoomLayer.minScale = 0.2
    # panZoomLayer.maxSpeed = 100.0
    # panZoomLayer.maxTouchDistanceToClick = 1000.0
    # panZoomLayer.panBoundsRect = CGRectNull
    # panZoomLayer.mode = 0


  end


  def layerPanZoom (sender, clickedAtPoint: aPoint, tapCount: tapCount)
    CCMacros.CCLOG("Clicked")
  end

  # def layerPanZoom (sender, touchPositionUpdated: newPos)

  # end

  # def layerPanZoom (sender, touchMoveBeganAtPosition: aPoint)

  # end  




end