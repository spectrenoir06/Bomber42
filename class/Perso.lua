local class = require 'class/middleclass'
local Sprite 	= require 'class/Sprite'

local Perso = class('Perso')

function Perso:initialize(posX, posY)
  	
  	self.posX =  posX or 64
  	self.posY =  posY or 64
  	self.speed = 300

	print(self.x)

	self.dX = 0
	self.dY = 0

	self.lX = 64
	self.lY = 64

	self.sprite = Sprite:new("texture/sprite.png", 64, 64)
	self.direction = 2

	self.sprite:addAnimation({9,10,11})
	self.sprite:addAnimation({0,1,2})
	self.sprite:addAnimation({3,4,5})
	self.sprite:addAnimation({6,7,8})

end

function Perso:draw()
	self.sprite:draw(self.posX, self.posY)
end

function Perso:update(dt)
	
	self.sprite:update(dt)

	if self.move then
		if self.direction == 1 then
          	self.posY 	= self.posY - 8
           	self.pixel	= self.pixel + 8
        elseif self.direction == 2 then
          	self.posY 	= self.posY + 8
           	self.pixel	= self.pixel + 8
       	elseif self.direction == 3 then
           	self.posX 	= self.posX - 8
          	self.pixel 	= self.pixel + 8
      	elseif self.direction == 4 then
          	self.posX 	= self.posX + 8
           	self.pixel	= self.pixel + 8
      	end
       	if self.pixel == 64 then
         	self.move = false
       	end
    end 
end


function Perso:up()
	if not self.move then
		if self.direction == 1 then
			self.move = true
			self.pixel = 0
			self.sprite:setAnim(1)
		else
			self.direction = 1
		end
	end
end

function Perso:down()
	if not self.move then
		if self.direction == 2 then
			self.move = true
			self.pixel = 0
			self.sprite:setAnim(2)
		else
			self.direction = 2
		end
	end
end

function Perso:left()
	if not self.move then
		if self.direction == 3 then
			self.move = true
			self.pixel = 0
			self.sprite:setAnim(3)
		else
			self.direction = 3
		end
	end
end

function Perso:right()
	if not self.move then
		if self.direction == 4 then
			self.move = true
			self.pixel = 0
			self.sprite:setAnim(4)
		else
			self.direction = 4
		end
	end
end

function Perso:getPosX()
	return self.posX
end

function Perso:getPosY()
	return self.posX
end

return Perso