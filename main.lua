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

local Game = require "class/Game"

function love.load()
	game = Game:new(0.3);
end


function love.draw()
	game:draw()
end

function love.update(dt)
	game:update(dt);
end

function love.mousepressed(x,y,button)

end