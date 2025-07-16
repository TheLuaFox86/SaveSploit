cls()
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
