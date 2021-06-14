# reset players + creative mode
execute at @e[tag=pvp_lobby,limit=1] run function sarex_pvp:structures/save_terrain
execute at @e[tag=pvp_lobby,limit=1] run function sarex_pvp:structures/load_lobby
schedule function sarex_pvp:start/return 1s
gamemode creative @a

# reset scores
scoreboard players set round_in_progress misc 0
tag @a remove ready
tag @a remove has_items
scoreboard players set @a pvp_sneak 0

# add scoreboard objectives again
scoreboard objectives add pvp_sneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add pvp_walk minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add pvp_sprint minecraft.custom:minecraft.sprint_one_cm

# pause timer again
scoreboard players set pause timer 1
scoreboard players set global timer 2400
scoreboard players add round misc 1 

# hide bossbar
bossbar set sarex_pvp:round_timer visible false

# points + underdog bonus
scoreboard players add @a points 1
#execute unless score underdog_threshold cvar matches 0 run function sarex_pvp:features/underdog
execute unless score underdog_threshold cvar matches 0 run function sarex_pvp:features/underdog2

# give book + clear inv
clear @a[distance=..128]
function sarex_pvp:give_book

# reset world border
worldborder set 96