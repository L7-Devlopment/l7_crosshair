local config = require 'config'

local function weaponLoop(weapon)
    if not cache.weapon then 
        SendNUIMessage({
            type = "dot",
            display = false
        })
        print('false')
    end

    while (cache.weapon == weapon) do
        if isPlayerAiming() then
            SendNUIMessage({
                type = "dot",
                display = true
            })
        else
            SendNUIMessage({
                type = "dot",
                display = false
            })
        end
        Wait(500)
    end
end

lib.onCache('weapon', function(value)
    if config.alwaysOn then return end
    if not cache.weapon and value then
        weaponLoop(value)
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        if config.alwaysOn then 
            SendNUIMessage({
                type = "dot",
                display = true
            })
        else 
            weaponLoop(cache.weapon)
        end
    end
end)