local saves = {}
local ots = class:getById("fileapi", 'opentycoon:otsav')
local lfte8 = class:getById('api', 'opentycoon:lfte8')
saves.load = function(_c, path, ...)
	local sf = ots.unpack(platform.readtext(path))
	key = tonumber('1' .. (_c.opentycoon.game.guid or 0))
	if key == 10 or sf.isuni == 1 then
		sf.isuni = 1
		key = 10
	end
	if sf.username ~= _c.opentycoon.game.username and sf.isuni == 0 then
		return _c, "username does not match"
	end
	--decypher pahse--
	sf = ots.decypher(sf, key)
	local verify_key = _c.opentycoon.game.verify_key
	local check = lfte8:parse(sf.line1) == verify_key or sf.isuni == 1
	if not check then
		return _c, "verification failed"
	end
	--load stats--
	local c = _c
	c.opentycoon.game.money = tonumber(lfte8:parse(sf.line2))
	-- items
	local items = lfte8:parse(sf.line3):split('\n')
	for i=1, #items do
		print(items[i])
		local itm = c:getById("item", items[i]:split("=")[1]) 
		itm.amount = tonumber(items[i]:split("=")[2])
		c:setById('item', items[i]:split("=")[1], itm)
	end
	--script--
	local sc = c
	if sf.isuni == 1 then
		sc = _c
	end
	local ok, r = pcall(load(lfte8:parse(sf.line4), "=otsav", 't'), sc, sf, ...)
	if ok and sf.isuni == 0 then
		return r, '', true
	end
	return c, 'UniSaves dont allow modification of class through scripts (make sure to use a official account or a local account file (.otla)', true
end
saves.save = function(_c, path, spt)
	itms = ""
	for d, cl in pairs(_c) do
		if type(cl) == "table" then
		if cl.item then
			for itmn, v in pairs(cl.item) do
				if type(v) == "table" then
				itms = itms .. d .. ":" .. itmn .. "=" .. v.amount .. "\n"
				end
			end
		end
		end
	end 
	local sf = {
		isuni=0,
		username=_c.opentycoon.game.username,
		length=4,
		line1=lfte8:deparse2tb(_c.opentycoon.game.verify_key),
		line2=lfte8:deparse2tb(tostring(_c.opentycoon.game.money)),
		line3=lfte8:deparse2tb(itms:sub(1, #itms - 1)),
		line4=lfte8:deparse2tb(spt or 'return ...'),
	}
	key = tonumber('1' .. (_c.opentycoon.game.guid or 0))
	if key == 10 then
		sf.isuni = 1
	end
	platform.writetext(path, ots.pack(ots.cypher(sf, key)))
end
class.opentycoon.api:api('saves', saves)