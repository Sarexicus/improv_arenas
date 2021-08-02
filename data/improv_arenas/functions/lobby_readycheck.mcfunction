#> improv_arenas:lobby_readycheck

# ready up if all good
execute as @a[scores={iarena_sneak=30..},tag=!ready] run tellraw @a ["",{"text":"[improv_arenas] ","color":"green"},{"selector":"@s"},{"text":" is now ready"}]
tag @a[scores={iarena_sneak=30..},tag=!ready] add ready
effect give @a[tag=ready] glowing 1000 0 true

# unready if moved
execute as @a[scores={iarena_sneak=..29},tag=ready] run tellraw @a ["",{"text":"[improv_arenas] ","color":"green"},{"selector":"@s"},{"text":" is "},{"text":"no longer","color":"red"},{"text":" ready"}]
tag @a[scores={iarena_sneak=..29},tag=ready] remove ready
effect clear @a[tag=!ready] glowing

# reset sneak score if moved
#scoreboard players set @a[scores={iarena_walk=20..}] iarena_sneak 0
#scoreboard players set @a[scores={iarena_walk=20..}] iarena_walk 0
scoreboard players set @a[scores={iarena_sprint=5..}] iarena_sneak 0
scoreboard players set @a[scores={iarena_sprint=5..}] iarena_sprint 0

# start if everyone ready
execute unless entity @a[tag=!ready,team=!iarena_spectator] if entity @a[tag=ready] run function improv_arenas:start/start
