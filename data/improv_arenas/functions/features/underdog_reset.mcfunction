#> improv_arenas:features/underdog_reset

#find the highest player's score
scoreboard players set #highest iarena_kills 0
scoreboard players operation #highest iarena_kills > @a iarena_kills

#subtract it by the threshold
scoreboard players operation #highest iarena_kills -= underdog_threshold iarena_cvar

#if there are any players below this threshold, give them extra points equal to underdog_pointvalue
execute as @a if score @s iarena_kills <= #highest iarena_kills run tag @s add underdog

# only resetters can reset
scoreboard players enable @a[tag=underdog] iarena_resetp
scoreboard players reset @a[tag=!underdog] iarena_resetp


#tellraw to announce underdog
execute if entity @a[tag=underdog] run tellraw @a ["",{"text":"[improv_arenas] ","color":"green"},{"text":"underdog: "},{"text":"Reset available for "},{"selector":"@a[tag=underdog]"}]
#execute as @a[tag=underdog] run tellraw @s ["",{"text":"[improv_arenas] ","color":"green"},{"text":"underdog: "},{"text":"[⏪ Reset]","clickEvent":{"action":"run_command","value":"/trigger iarena_resetp"}},{"text":" (for "},{"score":{"name":"reset_value","objective":"iarena_var"}},{"text":" items, "},{"score":{"name":"@s","objective":"iarena_resetv"}},{"text":" points)"}]

execute as @a[tag=underdog] run tellraw @s ["",{"text":"[improv_arenas] ","color":"green"},{"text":"underdog: "},{"text":"[⏪ Reset]","color":"green","clickEvent":{"action":"run_command","value":"/trigger iarena_resetp"}},{"text":" (for "},{"score":{"name":"round","objective":"iarena_var"}},{"text":" items, "},{"score":{"name":"reset_value","objective":"iarena_var"}},{"text":" points)"}]


#cleanup
tag @a remove underdog