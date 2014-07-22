local class 	= require 'class/middleclass'
local Sprite 	= require 'class/Sprite'

local Bombe = class('Bombe')

function Bombe:initialize(posX, posY, perso, game)

	self.posX =  posX or 64
  	self.posY =  posY or 64
  	self.sprite = Sprite:new("texture/bombe.png", 64, 64)
  	self.time = 3
  	self.game = game
  	self.perso = perso
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

	if self.game.map:getTile(self.posX/64 - 1, self.posY/64, 2)[2]==2 then
		self.game.map:setTile(self.posX/64 - 1, self.posY/64, 5, 2)
	end
	if self.game.map:getTile(self.posX/64 + 1, self.posY/64, 2)[2]==2 then
		self.game.map:setTile(self.posX/64 + 1, self.posY/64, 5, 2)
	end
	if self.game.map:getTile(self.posX/64, self.posY/64 + 1, 2)[2]==2 then
		self.game.map:setTile(self.posX/64, self.posY/64 + 1, 5, 2)
	end
	if self.game.map:getTile(self.posX/64, self.posY/64 - 1, 2)[2]==2 then
		self.game.map:setTile(self.posX/64, self.posY/64 - 1, 5, 2)
	end

end

return Bombe