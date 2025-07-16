_G.platform = {}
_G.cls = function()
	os.execute("clear")
end
local lfs = require "lfs"
platform.fs = {}
_G.string.split = function(txt, del)
	local out = {}
	local c = 0
	local a = ""
	i = 0
	for _=1, #txt do
		i = i + 1
		if txt:sub(i , i + (#del - 1)) == del then
			c = c + 1
			out[c] = a
			a = ""
			i = i + (#del - 1)
		else
			--print(txt:sub(i, i + (#del - 1)))
			a = a .. txt:sub(i, i)
		end
	end
	out[c + 1] = a
	return out
end
local iowrite = _G.io.write
_G.io.write = function(...)
iowrite(...)
io.flush()
end
platform.readtext = function(path)
	local f = io.open(path, "r")
	local dat = f:read('*a')
	f:flush()
	f:close()
	return dat
end
platform.writetext = function(path, data)
	local f = io.open(path, "w+")
	f:write(data)
	f:flush()
	f:close()
end
_G.each = function(a)
	i = 0
	return function(a)
		i = i + 1
		local v = a[i]
		if v then
			return v
		end
	end, a
end
function platform.fs.listdir(p)
  local a = {}
	for b in lfs.dir(p) do
		if b ~= '.' and b ~= '..' then
			table.insert(a, b)
		end
	end
	return each(a)
end
platform.zip = {}
function platform.zip.extract(file, to)
  os.execute('unzip -o "' .. file .. '" -d "' .. to .. '"')
end
