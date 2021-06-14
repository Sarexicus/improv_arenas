# make worldborder large enough as a default
worldborder set 96

# if the "keepTeams" cvar is not set, then spread randomly
execute unless score keepTeams cvar matches 1 run spreadplayers ~ ~ 32 40 false @a 

# if the "keepTeams" cvar *is* set, then check to see if there are players not on teams, and if so, don't respect it
execute if score keepTeams cvar matches 1 unless entity @a[team=] run spreadplayers ~ ~ 32 40 true @a 
execute if score keepTeams cvar matches 1 if entity @a[team=] run spreadplayers ~ ~ 32 40 false @a 

# keeps players from sticking in each other
execute as @a at @s run spreadplayers ~ ~ 2 2 false @s

# kill the chest entities
kill @e[type=item,nbt={Item:{id:"minecraft:chest"}}]

# unpause timer
scoreboard players set pause timer 0

# change shields

# show bossbar
bossbar set sarex_pvp:round_timer players @a
bossbar set sarex_pvp:round_timer visible true

# start the worldborder
worldborder set 16
scoreboard players operation set_border misc = border_size cvar
scoreboard players set modify_border misc 1
schedule function sarex_pvp:start/border 5s