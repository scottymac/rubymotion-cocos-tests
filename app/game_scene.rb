class GameScene < CCScene

  def init
    super.tap do |me|
      me.addChild( BackgroundMapLayer.node, z: 0 )
      me.addChild( GameplayLayer.node, z: 5)
      me.addChild( InterfaceLayer.node, z: 10)
    end
  end

end