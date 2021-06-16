# spectator spawnpoints
execute as @a[gamemode=survival] unless score @s iarena_deathT matches 1.. at @s run spawnpoint @s
execute as @a[gamemode=survival,scores={iarena_deathT=1..}] run gamemode spectator @s

execute as @a[scores={iarena_killT=1..}] store result score @s iarena_health run data get entity @s Health 1


scoreboard players operation @a[scores={iarena_deathT=1..}] iarena_temp = @a[limit=1,scores={iarena_killT=1..}] iarena_health
scoreboard players operation @a[scores={iarena_deathT=1..}] iarena_temp %= 2 iarena_constant
tag @a[scores={iarena_deathT=1.., iarena_temp=1}] add halfh

tellraw @a[scores={iarena_deathT=1..}] ["",{"text":"[improv_arenas] ","color":"green"},{"selector":"@a[scores={iarena_killT=1..}]"},{"text":" had "},{"text":"[","color":"red"},{"score":{"name":"@a[sort=nearest,limit=1,scores={iarena_killT=1..}]","objective":"iarena_health"},"color":"red"},{"text":" ❤]","color":"red"},{"text":" remaining"}]
tellraw @a[scores={iarena_deathT=1..},tag=halfh] ["",{"text":"[improv_arenas] ","color":"green"},{"selector":"@a[scores={iarena_killT=1..}]"},{"text":" had "},{"text":"[","color":"red"},{"score":{"name":"@a[sort=nearest,limit=1,scores={iarena_killT=1..}]","objective":"iarena_health"},"color":"red"},{"text":" ❤]","color":"red"},{"text":" remaining"}]
# because storing decimals floors them
tag @a remove halfh

#resetting the triggers
scoreboard players set @a iarena_deathT 0
scoreboard players set @a iarena_killT 0

# win condition
execute if entity @a[team=iarena_gold] unless entity @a[team=!iarena_gold,gamemode=!spectator] run function improv_arenas:start/reset
execute if entity @a[team=iarena_green] unless entity @a[team=!iarena_green,gamemode=!spectator] run function improv_arenas:start/reset
execute if entity @a[team=iarena_blue] unless entity @a[team=!iarena_blue,gamemode=!spectator] run function improv_arenas:start/reset
execute if entity @a[team=iarena_purple] unless entity @a[team=!iarena_purple,gamemode=!spectator] run function improv_arenas:start/reset
execute if entity @a[team=iarena_red] unless entity @a[team=!iarena_red,gamemode=!spectator] run function improv_arenas:start/reset

# no-team win condition (only one player left alive)
execute unless data storage improv_arenas:storage {debug:1b} store result storage improv_arenas:storage PlayersAlive int 1 if entity @a[gamemode=!spectator]
execute if data storage improv_arenas:storage {PlayersAlive:1} run function improv_arenas:start/reset
