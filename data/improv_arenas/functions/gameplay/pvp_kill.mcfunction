#> improv_arenas:gameplay/pvp_kill
#> context: player who killed

execute if data storage improv_arenas:storage {debug:true} run say I killed(?) @a[tag=ia_died]

scoreboard players operation @s iarena_temp = @s iarena_health

# check for 1/2 heart
scoreboard players operation @s iarena_temp %= 2 iarena_constant
tag @s[scores={iarena_temp=1}] add ia_halfh

# get final hearts (halved)
scoreboard players operation @s iarena_temp = @s iarena_health
scoreboard players operation @s iarena_temp /= 2 iarena_constant

execute if entity @s[tag=ia_halfh] run tellraw @a[tag=ia_died] ["",{"text":"[improv_arenas] ","color":"green"},{"selector":"@s"},{"text":" had "},{"text":"[","color":"red"},{"score":{"name":"@s","objective":"iarena_temp"},"color":"red"},{"text":".5 ❤ (","color":"red"},{"score":{"name":"@s","objective":"iarena_health"},"color":"red"},{"text":" HP)]","color":"red"},{"text":" remaining"}]
execute if entity @s[tag=!ia_halfh] run tellraw @a[tag=ia_died] ["",{"text":"[improv_arenas] ","color":"green"},{"selector":"@s"},{"text":" had "},{"text":"[","color":"red"},{"score":{"name":"@s","objective":"iarena_temp"},"color":"red"},{"text":" ❤ (","color":"red"},{"score":{"name":"@s","objective":"iarena_health"},"color":"red"},{"text":" HP)]","color":"red"},{"text":" remaining"}]
tag @s remove ia_halfh

tag @a remove ia_died

advancement revoke @s only improv_arenas:backend/pvp_kill