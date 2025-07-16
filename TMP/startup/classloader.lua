dofile(config.tmpp .. config.di .. "startup" .. config.di .. "classCore.lua")
log("Plugin PH2:")
log(pcall(function()
    pluginp = config.tmpp .. "/startup/plugin"
    config.pluginp = pluginp
    dofile(pluginp .. config.di .. 'init4mods.lua')
end))
log("Loading Classes")
for i=-99, 299  do
for a in platform.fs.listdir(config.tmpp .. config.di .. "class") do
  log(a, i)
  if tonumber(a:sub(1, 3)) == i then
    dofile(config.tmpp .. config.di .. "class" .. config.di .. a)
  end
end
end
