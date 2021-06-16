#> improv_arenas:start/start

# set to survival, removing any contraband
clear @a[distance=..128]
gamemode survival @a

data remove storage improv_arenas:storage PlayersAlive

# remove "ready" status
scoreboard players set @a ready 0
scoreboard players set @a iarena_sneak 0
tag @a remove ready

gamerule doFireTick true

# start the round formally
scoreboard players set round_in_progress iarena_var 1
scoreboard objectives setdisplay sidebar

#remove scoreboard objectives (to prevent lag)
scoreboard objectives remove iarena_sneak
scoreboard objectives remove iarena_walk
scoreboard objectives remove iarena_sprint

# fully heal + slow
effect clear @a
effect give @a minecraft:slowness 4 10 true
effect give @a minecraft:jump_boost 4 128 true
effect give @a minecraft:blindness 5 1 true
effect give @a minecraft:resistance 5 127 true
effect give @a minecraft:saturation 10 100 true
effect give @a minecraft:instant_health 10 100 true

# copy items to inventory from ender chest
tag @a remove has_items
execute as @r[tag=!has_items] run function improv_arenas:start/get_items

#remove lobby
execute at @e[tag=iarena_lobby,sort=nearest,limit=1] run function improv_arenas:structures/load_terrain

#reset bossbar color
bossbar set improv_arenas:round_timer color green

execute at @e[tag=iarena_lobby,sort=nearest,limit=1] run schedule function improv_arenas:start/teleport 1t
