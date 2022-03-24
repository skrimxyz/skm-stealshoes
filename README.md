# QBCore steal shoe simple script
The main problem with this script is you can steal unlimited shoes from a person because it doesn't check if the target have shoes or not. If you know how to solve this, make a pull ❤️

Preview: https://streamable.com/rh8mp2

# Step 1
Add the item in qb-core/shared/items.lua

	['weapon_shoe']                = {['name'] = 'weapon_shoe', ['label'] = 'Shoes', 					['weight'] = 900, 		['type'] = 'weapon', 	['ammotype'] = nil,						['image'] = 'shoes.png', 		['unique'] = true, 		['useable'] = false, 	['description'] = 'I promise those are not stolen!'},

# Step 2
Search in your inventory this event "inventory:client:UseWeapon" and then add this:

```	
elseif weaponName == "weapon_shoe" then
        GiveWeaponToPed(ped, GetHashKey(weaponName), ammo, false, false)
        SetPedAmmo(ped, GetHashKey(weaponName), 2)
        SetCurrentPedWeapon(ped, GetHashKey(weaponName), true)
        TriggerEvent('qb-hud:client:ToggleWeaponMode', true)  
        TriggerServerEvent('QBCore:Server:RemoveItem', weaponName, 1)
        TriggerEvent('weapons:client:SetCurrentWeapon', weaponData, shootbool)
        currentWeapon = weaponName
```

# Step 3
Add the image in your inventory script!

![shoes](https://user-images.githubusercontent.com/92062857/159924852-646ceeba-45e7-4629-bc87-1521a7ed50ad.png)

# ⚠️ATTENTION⚠️
You will need a shoe model!
