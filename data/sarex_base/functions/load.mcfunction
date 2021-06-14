# timer
scoreboard objectives add timer dummy
scoreboard players set 20 timer 20
scoreboard players set 100 timer 100
scoreboard players set pause timer 1
scoreboard players set global timer 2400

#misc/cvar
scoreboard objectives add misc dummy
scoreboard objectives add cvar dummy

#enabling features
execute unless score pvp_enable cvar matches 0..1 run scoreboard players set pvp_enable cvar 0
execute unless score cbow_enable cvar matches 0..1 run scoreboard players set cbow_enable cvar 0


#feature loads
function improv_arenas:pvp_load
