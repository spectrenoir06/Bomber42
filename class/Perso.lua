local class		= require 'class/middleclass'
local Sprite 	= require 'class/Sprite'

local Perso = class('Perso')

function Perso:initialize(posX, posY)
  	
  	self.posX = posX or 32
  	self.posY = posY or 32
	self.sprite = Sprite:new("texture/sprite.png", 32, 32)

end

function Perso:draw()
	
	self.sprite:draw(self.posX, self.posY)

end

return Perso