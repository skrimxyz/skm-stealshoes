# QBCore steal shoe simple script
The main problem with this script is you can steal unlimited shoes from a person because it doesn't check if the target have shoes or not. If you know how to solve this, make a pull ❤️

# Step 1
Add the item in qb-core/shared/items.lua
	`['weapon_shoe'] 				 = {['name'] = 'weapon_shoe', 		      	['label'] = 'Shoes', 					['weight'] = 900, 		['type'] = 'weapon', 	['ammotype'] = nil,						['image'] = 'shoes.png', 		['unique'] = true, 		['useable'] = false, 	['description'] = 'I promise those are not stolen!'},
