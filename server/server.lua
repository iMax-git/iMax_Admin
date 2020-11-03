ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("setskin", function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    PlayerGroup = xPlayer.getGroup()
    local model = args[1]
    local count = string.len(model)
    if PlayerGroup == 'owner' or PlayerGroup == 'superadmin' or PlayerGroup == 'admin' then
        if model == "police" then
            local newskin = "s_m_y_cop_01"
            TriggerClientEvent("changeskin", source, newskin)
        elseif model == "policef" then
            local newskin = "GCPD_Female"
            TriggerClientEvent("changeskin", source, newskin)
        elseif model == "medic" then
            local newskin = "s_m_m_paramedic_01"
            TriggerClientEvent("changeskin", source, newskin)
        elseif model == "swat" then
            local newskin = "s_m_y_swat_01"
            TriggerClientEvent("changeskin", source, newskin)
        elseif model == "swat2" then
            local newskin = "s_m_y_swat_02"
            TriggerClientEvent("changeskin", source, newskin)
        elseif model == "reset" then
            TriggerClientEvent("resetskin", source)
        elseif count < 6 then
            TriggerClientEvent('esx:showNotification', source, "~r~Error: ~o~Argument Invalide")
        else
            TriggerClientEvent("changeskin", source, model)
        end
        if model == "reset" then
            TriggerClientEvent('esx:showNotification', source, "~g~Tu à récuperer ton skin de base !")
        elseif count > 6 then
            TriggerClientEvent('esx:showNotification', source, "~g~Le Skin "..model.." est chargé !")
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~Tu n'a pas le droit à cette commande !")
    end 
end)

RegisterCommand("weapequip", function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    PlayerGroup = xPlayer.getGroup()
    local state = args[1]
    if state ~= "r" then
        local state = "a"
    end    
    local attach = args[2]
    if PlayerGroup == 'owner' or PlayerGroup == 'superadmin' or PlayerGroup == 'admin' then
        if attach == "1" then
            if state == "r" then
                TriggerClientEvent('removeattachement', source)
            else
                TriggerClientEvent('addattachement', source, 'suppressor')
            end
        elseif attach == "2" then
            if state == "remove" then
                TriggerClientEvent('removeattachement', source)
            else
                TriggerClientEvent('addattachement', source, 'flashlight')
            end
        elseif attach == "3" then
            if state == "remove" then
                TriggerClientEvent('removeattachement', source)
            else
                TriggerClientEvent('addattachement', source, 'grip')
            end
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~Tu n'a pas le droit à cette commande !")
    end 
end)


RegisterCommand("carryweapon", function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    PlayerGroup = xPlayer.getGroup()
    local state = args[1]
    if state == "off" then
        TriggerClientEvent('removecarryweapon', source)
    elseif state == "on" then
        TriggerClientEvent('carryweapon', source)
    end
end)
