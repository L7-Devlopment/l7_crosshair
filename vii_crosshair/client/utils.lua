function isPlayerAiming()
    return (IsPlayerFreeAiming(cache.playerId) or IsControlPressed(0, 25)) and true or false
end