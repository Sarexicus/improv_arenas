execute unless entity @e[tag=iarena_lobby,limit=1] run fill ~ ~ ~ ~15 ~5 ~-10 air replace
execute at @e[tag=iarena_lobby,sort=nearest,limit=1] run function improv_arenas:structures/load_terrain
worldborder set 100000

# kill dropped items + the lobby armor stand
kill @e[type=item,distance=..20]
kill @e[type=area_effect_cloud,tag=iarena_lobby]

scoreboard players set round_in_progress iarena_var -1

# unload the teams (empties and clears)
team remove iarena_gold
team remove iarena_green
team remove iarena_purple
team remove iarena_blue
team remove iarena_red
team remove iarena_spectator