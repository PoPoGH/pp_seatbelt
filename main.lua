print("[pp_seatbelt] ON")

seatbeltON = false
ped = PlayerPedId()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
            if IsPedInAnyVehicle(ped) then
                if IsControlJustPressed(1, 311) and not seatbeltON then
                    ESX.ShowNotification("~g~SeatBelt ON", "info")
                    seatbeltON = true
                    Citizen.Wait(10)
                end
                    if IsControlJustPressed(1, 311) and seatbeltON then
                        ESX.ShowNotification("~r~SeatBelt OFF", "info")
                        seatbeltON = false
                    end 
                    if seatbeltON then seatbeltActivate()
                       Citizen.Wait(10)
                    if not seatbeltON then seatbeltDisable()
                       Citizen.Wait(10)
                    end
            end
        end
    end
end)

function seatbeltActivate()
    if seatbeltON == true then
        DisableControlAction(0, 75, true) -- can't get out when stop
        DisableControlAction(27, 75, true) -- can't get out when dr
    end
end

function seatbeltDisable()
    if seatbeltON == false then
        print('centure détacher et control normal')
        EnableControlAction(0, 75, true) -- can't get out when stop
        EnableControlAction(27, 75, true) -- can't get out when drive
    end
end