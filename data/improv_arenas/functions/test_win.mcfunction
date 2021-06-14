# spectator spawnpoints
execute as @a[gamemode=survival] unless score @s pvp_deathTrigger matches 1.. at @s run spawnpoint @s
execute as @a[gamemode=survival,scores={pvp_deathTrigger=1..}] run gamemode spectator @s

execute as @a[scores={pvp_killTrigger=1..}] store result score @s pvp_healthCheck run data get entity @s Health 1
# because storing decimals floors them
tag @a remove even
tag @a[scores={pvp_killTrigger=1..,pvp_healthCheck=2}] add even
tag @a[scores={pvp_killTrigger=1..,pvp_healthCheck=4}] add even
tag @a[scores={pvp_killTrigger=1..,pvp_healthCheck=6}] add even
tag @a[scores={pvp_killTrigger=1..,pvp_healthCheck=8}] add even
tag @a[scores={pvp_killTrigger=1..,pvp_healthCheck=10}] add even
tag @a[scores={pvp_killTrigger=1..,pvp_healthCheck=12}] add even
tag @a[scores={pvp_killTrigger=1..,pvp_healthCheck=14}] add even
tag @a[scores={pvp_killTrigger=1..,pvp_healthCheck=16}] add even 
tag @a[scores={pvp_killTrigger=1..,pvp_healthCheck=18}] add even 
tag @a[scores={pvp_killTrigger=1..,pvp_healthCheck=20}] add even 
execute as @a[scores={pvp_killTrigger=1..}] store result score @s pvp_healthCheck run data get entity @s Health 0.5
execute as @a[scores={pvp_deathTrigger=1..}] if entity @a[scores={pvp_killTrigger=1..},tag=even] run tellraw @s ["",{"text":"[improv_arenas] ","color":"green"},{"selector":"@a[scores={pvp_killTrigger=1..}]"},{"text":" had "},{"text":"[","color":"red"},{"score":{"name":"@a[sort=nearest,limit=1,scores={pvp_killTrigger=1..}]","objective":"pvp_healthCheck"},"color":"red"},{"text":" ❤]","color":"red"},{"text":" remaining"}]
execute as @a[scores={pvp_deathTrigger=1..}] if entity @a[scores={pvp_killTrigger=1..},tag=!even] run tellraw @s ["",{"text":"[improv_arenas] ","color":"green"},{"selector":"@a[scores={pvp_killTrigger=1..}]"},{"text":" had "},{"text":"[","color":"red"},{"score":{"name":"@a[sort=nearest,limit=1,scores={pvp_killTrigger=1..}]","objective":"pvp_healthCheck"},"color":"red"},{"text":".5 ❤]","color":"red"},{"text":" remaining"}]

#resetting the triggers
scoreboard players set @a pvp_deathTrigger 0
scoreboard players set @a pvp_killTrigger 0

# win condition
execute if entity @a[team=pvp_gold] unless entity @a[team=!pvp_gold,gamemode=!spectator] run function improv_arenas:start/reset
execute if entity @a[team=pvp_green] unless entity @a[team=!pvp_green,gamemode=!spectator] run function improv_arenas:start/reset
execute if entity @a[team=pvp_blue] unless entity @a[team=!pvp_blue,gamemode=!spectator] run function improv_arenas:start/reset
execute if entity @a[team=pvp_purple] unless entity @a[team=!pvp_purple,gamemode=!spectator] run function improv_arenas:start/reset
execute if entity @a[team=pvp_red] unless entity @a[team=!pvp_red,gamemode=!spectator] run function improv_arenas:start/reset
# no team win condition
execute store result storage improv_arenas:storage PlayersAlive int 1 if entity @a[gamemode=!spectator]
execute if data storage improv_arenas:storage {PlayersAlive:..1} run function improv_arenas:start/reset
