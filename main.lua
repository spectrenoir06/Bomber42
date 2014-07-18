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

function love.load()
	map = Map:new("map/exemple.json","map/tileset.png")
end


function love.draw()
	map:draw(0,0)
end

function love.mousepressed(x,y,button)
	
end