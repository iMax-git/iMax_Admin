-- server
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterCommand("setskin", function (source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil then
        local PlayerGroup = xPlayer.getGroup()
        local SuspectPlayer = ESX.GetPlayerFromId(args[0])
        if PlayerGroup ~= nil and (PlayerGroup == 'owner' or PlayerGroup == 'superadmin' or PlayerGroup == 'admin') then
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                local model = GetHashKey(args[0])
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        RequestModel(model)
                        Citizen.Wait(0)
                    end
                    SetPlayerModel(PlayerId(), model)
                    SetModelAsNoLongerNeeded(model)
                    SetPedArmour(GetPlayerPed(-1), 1000000000) -- Ajout armure
                    GetPedArmour(GetPlayerPed(-1), 1000000000)
                    TriggerEvent('skinchanger:loadSkin', skin)
                    TriggerEvent('esx:restoreLoadout')
      
              end)
        else
            TriggerEvent("chat:addMessage", {
                color = {255, 0, 0},
                multiline = true,
                args = {"Tu n'a pas le droit d'exectuer cette commande !" }
            })
        end  
    end      
end, true)