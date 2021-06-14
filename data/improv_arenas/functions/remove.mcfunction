execute unless entity @e[tag=pvp_lobby,limit=1] run fill ~ ~ ~ ~15 ~5 ~-10 air replace
execute at @e[tag=pvp_lobby,sort=nearest,limit=1] run function improv_arenas:structures/load_terrain
worldborder set 100000

# kill dropped items + the lobby armor stand
kill @e[type=item,distance=..20]
kill @e[type=area_effect_cloud,tag=pvp_lobby]

scoreboard players set pvp_enable cvar 0 

# unload the teams (empties and clears)
team remove pvp_gold
team remove pvp_green
team remove pvp_purple
team remove pvp_blue
team remove pvp_red
