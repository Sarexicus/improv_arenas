#> improv_arenas:util/echest_spy
#> context: spectator

tellraw @s ["",{"text":"[improv_arenas] ","color":"green"},{"selector":"@p[team=!iarena_spectator]"},{"text":"'s ender chest contains:","color":"white"}]
tellraw @s ["",{"text":"[","color":"green"},{"nbt":"EnderItems[].id","entity":"@p[team=!iarena_spectator]","color":"gray"},{"text":"]","color":"green"}]