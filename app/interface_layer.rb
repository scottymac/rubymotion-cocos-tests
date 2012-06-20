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

end
