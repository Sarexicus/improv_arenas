# make worldborder large enough as a default
worldborder set 96

# if the "keepTeams" cvar is not set, then spread randomly
execute unless score keepTeams iarena_cvar matches 1 run spreadplayers ~ ~ 32 40 false @a 

# if the "keepTeams" cvar *is* set, then check to see if there are players not on teams, and if so, don't respect it
execute if score keepTeams iarena_cvar matches 1 unless entity @a[team=] run spreadplayers ~ ~ 32 40 true @a 
execute if score keepTeams iarena_cvar matches 1 if entity @a[team=] run spreadplayers ~ ~ 32 40 false @a 

# keeps players from sticking in each other
execute as @a at @s run spreadplayers ~ ~ 2 2 false @s

# kill the chest entities
kill @e[type=item,nbt={Item:{id:"minecraft:chest"}}]

# unpause timer
scoreboard players set pause timer 0

# change shields

# show bossbar
bossbar set improv_arenas:round_timer players @a
bossbar set improv_arenas:round_timer visible true

# start the worldborder
worldborder set 16
scoreboard players operation set_border iarena_var = border_size iarena_cvar
scoreboard players set modify_border iarena_var 1

# worldborder movement (armor stands)
execute as @e[tag=iarena_lobby] at @s run summon armor_stand ~ 250 ~ {Tags:["iarena_newcenter"],NoGravity:1b,Invisible:1b}

execute as @e[tag=iarena_lobby] at @s run spreadplayers ~ ~ 48 48 false @e[tag=iarena_newcenter]
execute as @e[tag=iarena_newcenter] at @s run tp @s ~ 250 ~


# border movement in 5s
schedule function improv_arenas:start/border 5s