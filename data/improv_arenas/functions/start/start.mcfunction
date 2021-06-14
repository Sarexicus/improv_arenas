clear @a[distance=..128]
gamemode survival @a

# remove "ready" status
scoreboard players set @a ready 0
scoreboard players set @a pvp_sneak 0
tag @a remove ready
scoreboard players set round_in_progress misc 1

#remove scoreboard objectives (to prevent lag)
scoreboard objectives remove pvp_sneak
scoreboard objectives remove pvp_walk
scoreboard objectives remove pvp_sprint

# fully heal + slow
effect clear @a
effect give @a minecraft:slowness 5 10 true
effect give @a minecraft:blindness 5 1 true
effect give @a minecraft:resistance 5 127 true
effect give @a minecraft:saturation 10 100 true
effect give @a minecraft:instant_health 10 100 true

# copy items to inventory from ender chest
tag @a remove has_items
execute as @r[tag=!has_items] run function sarex_pvp:start/get_items
#execute as @a at @s run setblock ~ 255 ~ yellow_shulker_box replace
#execute as @a at @s run data modify block ~ 255 ~ Items set from entity @s EnderItems
#execute as @a at @s run loot give @s mine ~ 255 ~ air{drop_contents:1b}
#execute as @a at @s run setblock ~ ~1 ~ air destroy

#remove lobby
execute at @e[tag=pvp_lobby,sort=nearest,limit=1] run function sarex_pvp:structures/load_terrain

#reset bossbar color
bossbar set sarex_pvp:round_timer color green

execute at @e[tag=pvp_lobby,sort=nearest,limit=1] run schedule function sarex_pvp:start/teleport 0.25s
