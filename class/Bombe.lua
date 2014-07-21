local class 	= require 'class/middleclass'
local Sprite 	= require 'class/Sprite'

local Bombe = class('Bombe')

function Bombe:initialize(posX, posY, perso, game)

	self.posX =  posX or 64
  	self.posY =  posY or 64
  	self.sprite = Sprite:new("texture/bombe.png", 64, 64)
  	self.time = 3
  	self.game = game
  	self.sprite:addAnimation({1})

end

function Bombe:draw()

	self.sprite:drawframe(self.posX, self.posY,0)
	love.graphics.print( math.ceil(self.time), self.posX + 32, self.posY + 32)

end

function Bombe:update(dt)

	self.sprite:update(dt)
	self.time = self.time - dt
	if (self.time < 0) then
		self:explode()
	end 

end

function Bombe:explode()

	self.game.sfxBomb:play()

end

return Bombe