local class		= require 'class/middleclass'
local Sprite 	= require 'class/Sprite'

local Perso = class('Perso')

function Perso:initialize()
  	
  	self.x =  32
  	self.y =  32
	
	self.dX = 0
	self.dY = 0
	self.test = Sprite:new("texture/sprite.png", 32, 32)

end

function Perso:draw()

	--love.graphics.rectangle( "fill", self.posX, self.posY, 32, 32)
	print(self.x)
	--self.test:drawframe(self.posX, self.posY, 1)

end

function Perso:update(dt)
	
	--self.sprite:update(dt)

	self.posX = self.posX + (self.dX * dt)
	self.posY = self.posY + (self.dY * dt)
	
end


function Perso:up()
	self.dY = -1;
end

function Perso:down()
	self.dY = 1;
end

function Perso:left()
	self.dX = -1;
end

function Perso:right()
	self.dX = 1;
end

return Perso