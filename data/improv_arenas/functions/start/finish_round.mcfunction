#> improv_arenas:start/finish_round

schedule clear improv_arenas:test_win

# reset players + creative mode
execute at @e[tag=iarena_lobby,limit=1] run function improv_arenas:structures/save_terrain
execute at @e[tag=iarena_lobby,limit=1] run function improv_arenas:structures/load_lobby
schedule function improv_arenas:start/return 5t

# every survivor deserves points
tag @a[gamemode=survival] add ia_legit
tag @a[gamemode=survival] add ia_survivor

# set everyone to creative without the "Your gamemode was updated" message
gamerule sendCommandFeedback false
gamemode creative @a[team=!iarena_spectator]
gamemode creative @a[team=iarena_spectator]
gamerule sendCommandFeedback true

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
scoreboard players add @a[tag=ia_legit] iarena_points 1
scoreboard players add @a[tag=!ia_legit] iarena_suicides 1
tag @a remove ia_legit

# underdog benefit (reset)
scoreboard players operation reset_value iarena_var = round iarena_var
scoreboard players remove reset_value iarena_var 1
function improv_arenas:features/underdog_reset

# give book + clear inv
clear @a[distance=..128]
function improv_arenas:give_book

# reset world border
scoreboard players set modify_border iarena_var 0
worldborder set 96
schedule clear improv_arenas:start/border

# advancements check on lobby
function improv_arenas:advancement_check_lobby

tag @a remove ia_survivor