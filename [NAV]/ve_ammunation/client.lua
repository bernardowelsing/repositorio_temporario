-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "armamentos-comprar-canivete" then
		TriggerServerEvent("armamentos-comprar","wbody_WEAPON_SWITCHBLADE")
	elseif data == "armamentos-comprar-martelo" then
		TriggerServerEvent("armamentos-comprar","wbody_WEAPON_HAMMER")
	elseif data == "armamentos-comprar-machado" then
		TriggerServerEvent("armamentos-comprar","wbody_WEAPON_HATCHET")
	elseif data == "armamentos-comprar-beisebol" then

	elseif data == "armamentos-comprar-paraquedas" then
		TriggerServerEvent("armamentos-comprar","wbody_GADGET_PARACHUTE")
	elseif data == "armamentos-comprar-compattach" then
		TriggerServerEvent("armamentos-comprar","compattach")

	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local marcacoes = {
	{ 1692.62,3759.50,34.70 },
	{ 252.89,-49.25,69.94 },
	{ 843.28,-1034.02,28.19 },
	{ -331.35,6083.45,31.45 },
	{ -663.15,-934.92,21.82 },
	{ -1305.18,-393.48,36.69 },
	{ -1118.80,2698.22,18.55 },
	{ 2568.83,293.89,108.73 },
	{ -3172.68,1087.10,20.83 },
	{ 21.32,-1106.44,29.79 },
	{ 811.19,-2157.67,29.61 }
}

RegisterCommand('acomprar', function(source, args, rawCmd)
	SetNuiFocus(false,false)
		for _,mark in pairs(marcacoes) do
			local x,y,z = table.unpack(mark)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
			if distance <= 2.0 then
						ToggleActionMenu()
					else
					end
				end
end)