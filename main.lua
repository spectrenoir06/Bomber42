--[[ **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    main.lua                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adoussau <antoine@doussaud.org>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/07/18 23:14:44 by adoussau          #+#    #+#              #
#    Updated: 2014/07/18 23:20:06 by adoussau         ###   ########.fr        #
#                                                                              #
# ***************************************************************************--]]

local Perso = require "class/Perso"
local Map 	= require "class/Map"

function love.load()
	map 	= Map:new("map/map1.json","map/tileset.png")
	perso 	= Perso:new(64,64);
end


function love.draw()
	map:draw(0,0)
	perso:draw()
end

function love.update(dt)
	perso:update(dt)
	if love.keyboard.isDown("up") then
		perso:up()
	elseif love.keyboard.isDown("down") then
		perso:down()
	elseif love.keyboard.isDown("left") then
		perso:left()
	elseif love.keyboard.isDown("right") then
		perso:right()
	end
end

function love.mousepressed(x,y,button)

end