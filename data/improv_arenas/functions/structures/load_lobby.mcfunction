#> improv_arenas:structures/load_lobby

#load saved terrain
setblock ~-7 ~-2 ~-5 minecraft:structure_block[mode=load]{name:"improv_arenas:lobby",ignoreEntities:1b,author:"Sarexicus",posX:0,posY:1,posZ:0,rotation:"NONE",mirror:"NONE",mode:"LOAD"} replace

setblock ~-7 ~-3 ~-5 minecraft:air
setblock ~-7 ~-3 ~-5 minecraft:redstone_block
setblock ~-7 ~-3 ~-5 minecraft:air
setblock ~-7 ~-2 ~-5 minecraft:air

kill @e[type=item,distance=..20]
