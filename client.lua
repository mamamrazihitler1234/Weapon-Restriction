local QBCore = exports['qb-core']:GetCoreObject()

local restrictedWeapons = {
    [`weapon_glock17`] = true,
    [`weapon_ar15`] = true,
    [`weapon_mossberg`] = true,
}

Citizen.CreateThread(function()
    while true do
        Wait(500)
        local ped = PlayerPedId()
        local weapon = GetSelectedPedWeapon(ped)
        local playerData = QBCore.Functions.GetPlayerData()

        if restrictedWeapons[weapon] then
            if playerData.job and playerData.job.name ~= "police" then
                SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
                QBCore.Functions.Notify("Нямаш право да използваш това оръжие!", "error")
            end
        end
    end
end)
