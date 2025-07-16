local game = {}
game.domain = 'opentycoon'
game.type = 'game'
game.money = 100
game.version = 'Alpha6'
game.username = config.username
game.guid = config.guid
game.verify_key = game.version .. "-UGHN76579075-" .. game.domain
local p = platform
p.paths = {
gameCode = config.tmmp,
gameData = config.gamep,
}
game.platform = p
class:append(game)