class.opentycoon.command:command("buy", function(id, a)
  for i=1, tonumber(a) do
    local a = class:getById('item', id)
    class.opentycoon.game.money = a:buy(class.opentycoon.game.money)
    class:setById('item', id, a)
  end
  print(class:getById('item', id).amount)
end)
class.opentycoon.command:command("sell", function(id, a)
    for i=1, tonumber(a) do
    local a = class:getById('item', id)
    class.opentycoon.game.money = a:sell(class.opentycoon.game.money)
    class:setById('item', id, a)
    end
    print(class:getById('item', id).amount)
end)
class.opentycoon.command:command("game", function(mode, ...)
	local s = class:getById("api", "saves")
	if mode == "save" then
		local name = ...
		s.save(class, class:getById('game', 'platform').paths.gameData .. "/saves/" .. name .. ".otsav", class.opentycoon.game.spt)
	elseif mode == 'load' then
		local name = ...
		class = s.load(class, class:getById('game', 'platform').paths.gameData .. "/saves/" .. name .. ".otsav", ...)
	elseif mode == "relaunch" then
		dofile(config.tmpp .. "/startup/classloader.lua")
	end
end)
class.opentycoon.command:command("clear", function()
	cls()
end)