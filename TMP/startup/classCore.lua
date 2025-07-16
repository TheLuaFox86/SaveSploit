_G.class =  {}
function class:append(tb)
  if not self[tb.domain] then self[tb.domain] = {} end
  self[tb.domain][tb.type] = tb
end
function class:getById(t, id)
	log(t)
  local a = {}
  for i, v in ipairs(id:split(":")) do
    a[i]=v
  end
  if not a[2] then
    a[2] = a[1]
    a[1] = "opentycoon"
  end
  log(a[1], a[2])
  return self[a[1]][t][a[2]]
end
function class:setById(t, id, val)
  local a = {}
  for i, v in ipairs(id:split(":")) do
    a[i]=v
  end
  if not a[2] then
    a[2] = a[1]
    a[1] = "opentycoon"
  end
  self[a[1]][t][a[2]] = val
 end
