class SpriteAttribute < Attribute
  attr_accessor :position, :velocity
  attr_reader :filename
  def initialize(entity, position, velocity, filename)
    @entity = entity
    @position = position
    @velocity = velocity
    @filename = filename
  end
end
