--alpha class now items class--

--Old Code--
--[[
local game = {}
game.domain = 'opentycoon'
game.type = 'game'
game.money = 1000
game.version = 'Alpha6'
game.username = config.username
class:append(game)

class.opentycoon.item:item({
    id = 'paperclip',
    price = 100,
    profit = 1.25,
    amount = 0
})

class.opentycoon.item:item({
    id = 'okacheese',
    price = 799,
    profit = 1.25,
    amount = 0
})

class.opentycoon.item:item({
    id = 'crap',
    price = 4566,
    profit = 1.25,
    amount = 0
})

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
]]--
--new code--
--This Is Now were the new items ly--
class.opentycoon.item:item({
    id = 'paperclip',
    price = 100,
    profit = 1.25,
    amount = 0
})

class.opentycoon.item:item({
    id = 'okacheese',
    price = 799,
    profit = 1.25,
    amount = 0
})

class.opentycoon.item:item({
    id = 'crap',
    price = 4566,
    profit = 1.25,
    amount = 0
})
class.opentycoon.item:item({
	id='Battery0',
	price='7787',
	profit=1.75,
	amount=0
})