------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------CBRP OFFICAL-----------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------
QBCore = nil

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(10)
        if QBCore == nil then
            TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)    
            Citizen.Wait(200)
        end
    end
end)

local hasjob = false
local ciuperci = 0

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-----------------------------------------------------------------------Lettuce Location-------------------------------------------------------
local coordonate = {
    {2645.72,4748.12,33.75},
    {2640.37,4753.22,33.50},
    {2636.66,4737.17,33.75},
    {2631.3,4742.17,33.60},
    {2640.80,4743.34,33.80},
    {2636.47,4746.69,33.70},
}

local sleep = 2000

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(sleep)
        perform = false
        local pos = GetEntityCoords(PlayerPedId())
        local metrii = math.floor(GetDistanceBetweenCoords(1725.1472167969,4642.4184570313,43.875480651855, GetEntityCoords(PlayerPedId())))
        if ciuperci == 6 then
            perform = true
            DrawText3D(pos.x,pos.y,pos.z, "~y~Go and Sell the Marijuana leaf", 1.2)
            --QBCore.Functions.Notify('Go and Sell the Marijuana leaf')
        end
        if hasjob == true then
            for i,v in pairs(coordonate) do
                local metrii2 = math.floor(GetDistanceBetweenCoords(v[1],v[2],v[3], GetEntityCoords(PlayerPedId())))
                if ciuperci == 1 or ciuperci == 2 or ciuperci == 3 or ciuperci == 4 or ciuperci == 5 then
                    perform = true
                    DrawText3D(pos.x,pos.y,pos.z, "Marijuana leaf ~r~"..ciuperci.."~w~/~g~6", 1.2)
                end
                if coordonate[i] ~= nil then
                    if metrii2 <=3 then
                        perform = true
                        DrawText3D(v[1],v[2],v[3]+0.7, "Press ~y~[E]~w~ to Marijuana leaf", 1.2)
                        if IsControlJustPressed(1,51) then
                            table.remove(coordonate,i)
                            local playerPed = PlayerPedId()
                            TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
	                        TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
                            SetTimeout(10000, function()
                            ClearPedTasks(playerPed)
                            QBCore.Functions.Notify('You picked 1 Marijuana leaf.')

                            ciuperci = ciuperci + 1
                                if ciuperci == 6 then
                                    SetNewWaypoint(1725.1472167969,4642.4184570313)
                                end
                            end)
                        end
                    end
                else
                    perform = true
                    DrawText3D(coordonate[i]+0.7, "Marijuana leaf already collected", 1.2)
                end
            end
        end
        if metrii <= 3 then
            perform = true
            DrawText3D(pos.x,pos.y,pos.z+0.1, "Press ~y~[E]~w~ to collect the leafs | Press ~y~[Y]~w~ to sell the Marijuana leafs", 1)
            if IsControlJustPressed(1,51) then
                if hasjob == false then
                cosdeoua = CreateObject(GetHashKey("prop_fruit_basket"), pos.x, pos.y, pos.z,  true,  true, true)
                AttachEntityToEntity(cosdeoua, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.22, -0.3+0.25, 0.0+0.16, 160.0, 90.0, 125.0, true, true, false, true, 1, true)
                QBCore.Functions.Notify('You are hired!, watch out for cops..')

                hasjob = true
                SetNewWaypoint(2631.6,4768.31)
                for i,v in pairs(coordonate) do
                    cvprop = CreateObject(GetHashKey('prop_veg_crop_03_cab'), v[1],v[2],v[3], false)
                end
                elseif hasjob == true then
                    QBCore.Functions.Notify('Go to Harvest Field.')
                end
            elseif IsControlJustPressed(1,246) then
                if ciuperci == 6 then
                table.insert(coordonate,{2645.72,4748.12,33.75})
                table.insert(coordonate,{2640.37,4753.22,33.50})
                table.insert(coordonate,{2636.66,4737.17,33.75})
                table.insert(coordonate,{2631.3,4742.17,33.60})
                table.insert(coordonate,{2640.80,4743.34,33.80})
                table.insert(coordonate,{2636.47,4746.69,33.70})
                TriggerServerEvent("hell_mushroomfarmer:sell")
                ciuperci = 0
                hasjob = false
                DeleteEntity(cosdeoua)
                DeleteEntity(cosdeoua)
                else
                    QBCore.Functions.Notify('this is not enough! go grab more', 'error')
                end
            end
        end
        if perform then
            sleep = 7
        elseif not perform then
            sleep = 2000
        end
    end
end)