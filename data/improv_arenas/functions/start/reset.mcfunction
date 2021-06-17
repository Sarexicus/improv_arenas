# reset players + creative mode
execute at @e[tag=iarena_lobby,limit=1] run function improv_arenas:structures/save_terrain
execute at @e[tag=iarena_lobby,limit=1] run function improv_arenas:structures/load_lobby
schedule function improv_arenas:start/return 5t
gamemode creative @a
effect clear @a

# prevent things from burning in the break
gamerule doFireTick false

# reset scores
scoreboard players set round_in_progress iarena_var 0
tag @a remove ready
tag @a remove has_items
scoreboard players set @a iarena_sneak 0

# kill old worldborder stands
execute at @e[tag=iarena_lobby,limit=1] run worldborder center ~ ~
kill @e[tag=iarena_center]
kill @e[tag=iarena_newcenter]

# add scoreboard objectives again
function improv_arenas:load/load_move_stats

# update points sidebar

scoreboard objectives setdisplay sidebar iarena_points

# pause timer again
scoreboard players set pause iarena_timer 1
scoreboard players set global iarena_timer 2400
scoreboard players add round iarena_var 1

# hide bossbar
bossbar set improv_arenas:round_timer visible false

# points
scoreboard players add @a[tag=!iarena_suicide] iarena_points 1
tag @a remove iarena_suicide

# underdog benefit (reset)
scoreboard players operation reset_value iarena_var = round iarena_var
scoreboard players remove reset_value iarena_var 1
function improv_arenas:features/underdog_reset

# give book + clear inv
clear @a[distance=..128]
function improv_arenas:give_book

# reset world border
worldborder set 96