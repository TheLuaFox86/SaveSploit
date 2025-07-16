local cmd = {
    domain = 'opentycoon',
    type = 'command',
    lst = {'list'},
    hello = function(...)
        print('hello world!', ...)
    end
}
function cmd:command(name, callback)
  table.insert(self.lst, name)
  self[name] = callback
end
class:append(cmd)
local item = {
    domain='opentycoon',
    type='item',
}
function item:item(tb)
  local a = tb
  function a:buy(money)
    local m, ok = money, false
    if self.price <= money then
      m = m - self.price
      self.amount = self.amount +  1
      ok = true
    end
    return m, ok
  end
    function a:sell(money)
    local m, ok = money, false
    if self.amount >= 1 then
      m = m + self.price * self.profit
      self.amount = self.amount -  1
      ok = true
    end
    return m, ok
  end
  self[tb.id] = a
end
class:append(item)
