RegisterServerCommand("stopround", function(player, args)
	print("[Console] Round stopped by ".. player:GetName())

	SendNotification("The round was stopped by admin", "error")

	StopRound(player)
end)

RegisterServerCommand("startround", function(player, args)
    print("[Console] Round started by ".. player:GetName())
    
	StartRound(player)
end)

RegisterServerCommand("kill", function(player, args)
	local character = player:GetControlledCharacter()
	if(character == nil) then return end

    print("[INFO] ".. player:GetName() .. " killed with command")

	character:SetHealth(0)    
end)

RegisterServerCommand("spawnweapons", function(player, args)
    print("[INFO] Weapons spawned by ".. player:GetName())

	SpawnWeaponsInWorld()

	SendPlayerNotification(player, "You spawn all weapons in the world")
end)

RegisterServerCommand("spawnvehicles", function(player, args)
    print("[INFO] Vehicles spawned by ".. player:GetName())

	SpawnVehiclesInWorld()

	SendPlayerNotification(player, "You spawn all vehicles in the world")
end)

RegisterServerCommand("destroyweapons", function(player, args)
    print("[INFO] All Weapons destroyed by ".. player:GetName())

    for i,weapon in pairs(NanosWorld:GetWeapons()) do
        weapon:Destroy()
    end
end)

RegisterServerCommand("destroyvehicles", function(player, args)
    print("[INFO] All Vehicles destroyed by ".. player:GetName())

    for i,veh in pairs(NanosWorld:GetVehicles()) do
        veh:Destroy()
    end
end)

RegisterServerCommand("setkarma", function(player, args)
    print("[INFO] ".. player:GetName() .." set his karma to ".. args[2])
    SetKarma(player, karma)
end)

RegisterServerCommand("play", function(player, args)
    local character = player:GetControlledCharacter()
	if(character == nil) then return end

    if(player:GetValue("lastAnim") ~= "" or player:GetValue("lastAnim") ~= nil) then
        character:StopAnimation("PolygonWorld::".. anim)
    end

    player:SetValue("lastAnim", anim)
    
    character:PlayAnimation("PolygonWorld::".. anim, 0, true)

    SendPlayerNotification(player, "[ANIMATION] PolygonWorld::".. anim)
end)

RegisterServerCommand("stop", function(player, args)
    local character = player:GetControlledCharacter()
	if(character == nil) then return end

    if(player:GetValue("lastAnim") ~= "" or player:GetValue("lastAnim") ~= nil) then
        character:StopAnimation("PolygonWorld::".. lastAnim)
    end

    player:SetValue("lastAnim", "")
end)

RegisterServerCommand("pos", function(player, args)
    local character = player:GetControlledCharacter()
	if(character == nil) then return end

    print("[POSITION] Saved Position: ".. dump(character:GetLocation()))
    
    Server:SendChatMessage(player, "[POSITION] Saved Position: ".. dump(character:GetLocation()))
end)

RegisterServerCommand("teleport", function(player, args)
    local char = player:GetControlledCharacter()
    char:SetLocation(Vector(-2700.62, -2365.31, 87.00))
end)

RegisterServerCommand("settraitor", function(player, args)
    player:SetValue("playerRole", ROLES.TRAITOR)
end)