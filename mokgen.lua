local lfs = require 'lfs'
local out = [[
do
	_G.log = print
	local cfg = {}
	cfg.username = arg[3]
	cfg.guid = arg[2]
	cfg.gamep = arg[1]
	cfg.tmpp = './'
	cfg.platform = "linux-ish"
	pcall(function()
	local f = io.open("Account.otla")
	local account = load('return ' .. f:read("*a"), '=account', 't')()
	f:flush()
	f:close()
	cfg.username = account.user
	cfg.guid = account.guid
	end)
	_G.config = cfg
	_G.platform = {}
	_G.cls = function()
	os.execute("clear")
	end
end
]]
os.execute("mkdir TMP")
os.execute('unzip -o "' .. arg[1] .. '" -d "' .. 'TMP/' .. '"')
local function rt(path)
local f = io.open(path, 'r')
local a = f:read("*a")
f:flush()
f:close()
return a
end
out = out .. 'do\n' .. rt('TMP/startup/init/linux-ish.lua') .. '\nend\n'
out = out .. 'do\n' .. rt('TMP/startup/classCore.lua') .. '\nend\n'
for i=1, 999 do
for v in lfs.dir('TMP/class') do
if v ~= '.' or v ~= '..' then
if tonumber(v:sub(1, 3)) == i then
	out = out .. 'do\n' .. rt('TMP/class/' .. v) .. '\nend\n'
end
end
end
end
out = out .. 'do\n' .. rt(arg[2]) .. '\nend\n'
local f = io.open(arg[3], "w+")
f:write(out)
f:flush()
f:close()
