#save terrain
setblock ~-7 ~-2 ~-5 minecraft:structure_block[mode=save]{name:"improv_arenas:pvp_terrain",ignoreEntities:1b,author:"Sarexicus",posX:0,posY:1,posZ:0,sizeX:15,sizeY:6,sizeZ:11,rotation:"NONE",mirror:"NONE",mode:"SAVE"} replace

setblock ~-7 ~-3 ~-5 minecraft:air
setblock ~-7 ~-3 ~-5 minecraft:redstone_block

fill ~7 ~-3 ~5 ~7 ~-2 ~5 minecraft:air replace minecraft:structure_block
fill ~7 ~-3 ~5 ~7 ~-2 ~5 minecraft:air replace minecraft:redstone_block
