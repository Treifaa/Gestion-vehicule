ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5000)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

local Menu = {
    gs = {
        "30 km/h",
        "50 km/h",
        "80 km/h",
        "120 km/h",
        "Désactiver"
    },

    list = 1,
}
local Menu2 = {
    gs = {
        "Avant Gauche",
        "Avant Droite",
        "Arrière Gauche",
        "Arrière Droite"
    },

    list = 1,
}

local Menu3 = {
    gs = {
        "Avant Gauche",
        "Avant Droite",
        "Arrière Gauche",
        "Arrière Droite"
    },

    list = 1,
}

function menu()


    
    local gsveh = RageUI.CreateMenu("Gestion Vehicule","Gestion Vehicule")

    local Ped = GetPlayerPed(-1)
    local GetSourcevehicle = GetVehiclePedIsIn(Ped, false)
    local Vengine = GetVehicleEngineHealth(GetSourcevehicle)/10
    local Vengine = math.floor(Vengine)
    local fuel = GetVehicleFuelLevel(GetSourcevehicle)






    RageUI.Visible(gsveh, not RageUI.Visible(gsveh))

    while gsveh do
        
        Citizen.Wait(0)

        RageUI.IsVisible(gsveh,true,true,true,function()

            RageUI.Separator("____________________")




            RageUI.Separator("État du Vehicule~s~ : ~b~ "..Vengine.."%")

            RageUI.Separator("Niveau d'éssence : ~b~"..math.ceil(fuel).." %")




            RageUI.Checkbox("Eteindre/Allumer Le moteur",nil , moteur,{},function(Hovered,Ative,Selected,Checked)
                if Selected then
                    moteur = Checked
                    if Checked then
                        SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId()), false, false, true)
                        SetVehicleUndriveable(GetVehiclePedIsIn(PlayerPedId()), false)                        
                    else
                        SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId()), true, false, true)
                        SetVehicleUndriveable(GetVehiclePedIsIn(PlayerPedId()), false)

                    end
                end
            end)


            RageUI.Checkbox("Ouvrir/Fermer le coffre",nil , coffre,{},function(Hovered,Ative,Selected,Checked)
                if Selected then
                    coffre = Checked
                    if Checked then
                        SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 5, false, false)
                    else
                        SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 5, false, false)
                    end
                end
            end)

            RageUI.Checkbox("Ouvrir/Fermer le Capot",nil , capot,{},function(Hovered,Ative,Selected,Checked)
                if Selected then
                    capot = Checked
                    if Checked then
                        SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 4, false, false)
                    else
                        SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 4, false, false)
                    end
                end
            end)






            RageUI.List('Limitateur', Menu.gs, Menu.list, nil, {}, true, function(Hovered, Active, Selected, Index)
                if (Active) then
                    if Selected then
                        if Index == 1 then
                            SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 8.1)
                        elseif Index == 2 then
                            SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 13.7)
                        elseif Index == 3 then
                            SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 22.0)
                        elseif Index == 4 then
                            SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 33.2)
                        elseif Index == 5 then
                            SetVehicleMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 0.0)

                        end
                    end
                end
                    Menu.list = Index;
            end)

            RageUI.List('Ouvrir/Fermer les Fenêtres', Menu2.gs, Menu2.list, nil, {}, true, function(Hovered, Active, Selected, Index)
                if (Active) then
                    if Selected then
                        if Index == 1 then
                            if not trff then
                                trff = true
                                RollDownWindow(GetVehiclePedIsIn(PlayerPedId()), 0) 
                            elseif trff then
                                trff = false
                                RollUpWindow(GetVehiclePedIsIn(PlayerPedId()), 0) 
                            end                       
                         elseif Index == 2 then
                            if not trff2 then
                                trff2 = true
                                RollDownWindow(GetVehiclePedIsIn(PlayerPedId()), 1) 
                            elseif trff2 then
                                trff2 = false
                                RollUpWindow(GetVehiclePedIsIn(PlayerPedId()), 1) 
                            end                        
                        elseif Index == 3 then
                            if not trff3 then
                                trff3 = true
                                RollDownWindow(GetVehiclePedIsIn(PlayerPedId()), 2) 
                            elseif trff3 then
                                trff3 = false
                                RollUpWindow(GetVehiclePedIsIn(PlayerPedId()), 2) 
                            end                        
                        elseif Index == 4 then
                            if not trff4 then
                                trff4 = true
                                RollDownWindow(GetVehiclePedIsIn(PlayerPedId()), 3) 
                            elseif trff4 then
                                trff4 = false
                                RollUpWindow(GetVehiclePedIsIn(PlayerPedId()), 3) 
                            end                        


                        end
                    end
                end
                    Menu2.list = Index;
            end)

            
            RageUI.List('Ouvrir/Fermer les Portes', Menu3.gs, Menu3.list, nil, {}, true, function(Hovered, Active, Selected, Index)
                if (Active) then
                    if Selected then
                        if Index == 1 then
                            if not trfp then
                                trfp = true
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 0, false, false)
                            elseif trfp then
                                trfp = false
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 0, false, false)
                            end                     
                         elseif Index == 2 then
                            if not trfp2 then
                                trfp2 = true
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 1, false, false)
                            elseif trfp2 then
                                trfp2 = false
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 1, false, false)
                            end                      
                        elseif Index == 3 then
                            if not trfp3 then
                                trfp3 = true
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 2, false, false)
                            elseif trfp3 then
                                trfp3 = false
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 2, false, false)
                            end                       
                        elseif Index == 4 then
                            if not four then
                                four = true
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 3, false, false)
                            elseif four then
                                four = false
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 3, false, false)
                            end                     


                        end
                    end
                end
                    Menu3.list = Index;
            end)







         
        end, function()
        end)

       

        


       
        if not RageUI.Visible(gsveh) then
            gsveh=RMenu:DeleteType("treifa", true)
        end

    end

end

Keys.Register('F1', 'F1', 'touche pour ouvrir le menu touche', function() 
    if IsPedSittingInAnyVehicle(PlayerPedId()) then
        menu()
    else
        ESX.ShowNotification("Vous devez être dans un véhicule")
    end
end)


