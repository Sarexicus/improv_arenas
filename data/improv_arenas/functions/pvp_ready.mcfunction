# ready up if all good
execute as @a[scores={pvp_sneak=30..},tag=!ready] run tellraw @a ["",{"text":"[improv_arenas] ","color":"green"},{"selector":"@s"},{"text":" is now ready"}]
tag @a[scores={pvp_sneak=30..},tag=!ready] add ready

# unready if moved
execute as @a[scores={pvp_sneak=..29},tag=ready] run tellraw @a ["",{"text":"[improv_arenas] ","color":"green"},{"selector":"@s"},{"text":" is "},{"text":"no longer","color":"red"},{"text":" ready"}]
tag @a[scores={pvp_sneak=..29},tag=ready] remove ready

# reset sneak score if moved
scoreboard players set @a[scores={pvp_walk=20..}] pvp_sneak 0
scoreboard players set @a[scores={pvp_walk=20..}] pvp_walk 0
scoreboard players set @a[scores={pvp_sprint=5..}] pvp_sneak 0
scoreboard players set @a[scores={pvp_sprint=5..}] pvp_sprint 0

# start if everyone ready
execute unless entity @a[tag=!ready] if entity @a[tag=ready] run function improv_arenas:start/start
