print("OT Forge")
local otl = require('launch')
for f in platform.fs.listdir(config.gamep .. config.di .. "mods") do
  print(f)
  require('compression').Zip(require('sys').fsentry(config.gamep .. config.di .. "mods" .. config.di .. f)):extractall(config.tmpp)
  print(f)
end
