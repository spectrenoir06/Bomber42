local class = require 'class/middleclass'

local Map 	= require "class/Map"
local Perso = require "class/Perso"
local Bombe = require "class/Bombe"

local Game = class('Game')

function Game:initialize(rand)

	self.map 	= Map:new("map/map1.json","map/tileset.png")
	math.randomseed(os.time())
	for x = 0,self.map.LX-1 do
		for y = 0, self.map.LY-1 do
			if (self.map.layers[2].data[x][y]==5) and (math.random() < rand) then
				if 	(x==1 and y==1) or (x==2 and y==1) or (x==1 and y==2) or 
					(x==self.map.LX-2 and y==self.map.LY-2) or (x==self.map.LX-3 and y==self.map.LY-2) or (x==self.map.LX-2 and y==self.map.LY-3) or
					(x==1 and y==self.map.LY-2) or (x==1 and y==self.map.LY-3) or (x==2 and y==self.map.LY-2) or
					(x==self.map.LX-2 and y==1) or (x==self.map.LX-2 and y==2) or (x==self.map.LX-3 and y==1) then
					
				else
					self.map:setTile(x,y,2,2)
				end
			end
		end
	end

	self.perso 	= {}
	self.obj 	= {}

	self.perso[1] = Perso:new(1*64, 1*64, self);
	self.perso[2] = Perso:new(19*64,19*64, self);

	self.sfxBomb = love.audio.newSource( "sound/bomb.wav", "static" )

	self.obj[1] = Bombe:new(64, 64, self.perso[1], self)

end

function Game:update(dt)
	
	for k,v in ipairs(self.obj) do
		v:update(dt)
		if v.time < 0 then
			table.remove(self.obj,k)
		end
	end

	for k,v in ipairs(self.perso) do
		v:update(dt)
	end

	if love.keyboard.isDown("up") then
		self.perso[1]:up()
	elseif love.keyboard.isDown("down") then
		self.perso[1]:down()
	elseif love.keyboard.isDown("left") then
		self.perso[1]:left()
	elseif love.keyboard.isDown("right") then
		self.perso[1]:right()
	elseif love.keyboard.isDown(" ") then
		self.perso[1]:pose()
	end

	if love.keyboard.isDown("w") then
		self.perso[2]:up()
	elseif love.keyboard.isDown("s") then
		self.perso[2]:down()
	elseif love.keyboard.isDown("a") then
		self.perso[2]:left()
	elseif love.keyboard.isDown("d") then
		self.perso[2]:right()
	end
end

function Game:draw()

	self.map:draw(0,0)
	
	for k,v in ipairs(self.obj) do
		v:draw()
	end

	for k,v in ipairs(self.perso) do
		v:draw()
	end

	for k,v in ipairs(self.obj) do
		love.graphics.print( v.time , 10 , k * 15)
	end
end

return Game