#variables 
scoreboard objectives add iarena_var dummy
scoreboard objectives add iarena_cvar dummy


# constants
scoreboard objectives add iarena_constant dummy
scoreboard players set 1 iarena_constant 1
scoreboard players set 2 iarena_constant 2
scoreboard players set 20 iarena_constant 20
scoreboard players set 100 iarena_constant 100

# timer
scoreboard objectives add iarena_timer dummy
scoreboard players set pause iarena_timer 1
scoreboard players set global iarena_timer 2400

worldborder damage buffer 0.5
worldborder damage amount 0.6

# setup + other misc scoreboards
scoreboard objectives add iarena_health health "Health"
scoreboard objectives add iarena_kills playerKillCount "Kills"
scoreboard objectives setdisplay list iarena_kills

scoreboard objectives add iarena_points dummy "Points"
execute as @a unless entity @s[scores={points=0..}] run scoreboard players set @s iarena_points 0

# triggers
scoreboard objectives add iarena_changep trigger 
scoreboard objectives add iarena_teamT trigger

# underdog
scoreboard objectives add iarena_temp dummy
scoreboard objectives add iarena_resetp trigger "Point Reset"
scoreboard objectives add iarena_resetv dummy "Reset Value"
scoreboard objectives add iarena_suicides dummy

# kill/death check
scoreboard objectives add iarena_deathT deathCount
scoreboard objectives add iarena_killT playerKillCount
execute as @a store result score @s iarena_health run data get entity @s Health

# setup bossbar stuff
bossbar add improv_arenas:round_timer "Round X"
bossbar set improv_arenas:round_timer style notched_12
bossbar set improv_arenas:round_timer color green
bossbar set improv_arenas:round_timer max 2400

# set default cvars
scoreboard players set border_time iarena_cvar 3
scoreboard players set border_size iarena_cvar 96
scoreboard players set underdog_threshold iarena_cvar 3
scoreboard players set keepTeams iarena_cvar 1

scoreboard objectives add iarena_hasShield dummy

data merge storage improv_arenas:storage {Setup:true}