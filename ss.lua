cls()
--new code here--

class.opentycoon.command.buy = nil
class.opentycoon.command.sell = nil
class.opentycoon.game.version = class.opentycoon.game.version .. "-mock"
--class.opentycoon.command.game = nil
print("savesploit mock opentycoon for hacking")
print([[
commands are:
ss-gen
runspt
]])
print(class.opentycoon.game.guid)
class.opentycoon.command:command("ss-gen", function(name, p)
	local s = class.opentycoon.api.saves
	s.save(class, class.opentycoon.game.platform.paths.gameData .. "/saves/" .. name .. ".otsav", platform.readtext(p))
end)
class.opentycoon.command:command("runspt", function()
	print('type youre lua code')
	a = load('local class = ...\n' .. io.read() .. "\nreturn class", '=Hack', 't')(class)
	class = a or class
end)
--new code here--
print('opentycoon ' .. class.opentycoon.game.version)
go = true
print("welcome " .. class.opentycoon.game.username)
while go do
  io.write('$' .. (class.opentycoon.game.money / 100) .. '> ')
  local a = io.read()
  if a == 'exit' then go = false return end
  b = string.split(a, " ")
  c = table.unpack(b, 1, 1)
  log(pcall(class.opentycoon.command[c], table.unpack(b, 2, #c)))
end
