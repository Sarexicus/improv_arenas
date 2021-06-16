#> improv_arenas:lobby_tick

# change points (use/refund)
execute as @a unless score @s iarena_changep matches 0 run scoreboard players operation @s iarena_points += @s iarena_changep
execute as @a unless score @s iarena_changep matches 0 run scoreboard players set @s iarena_changep 0
scoreboard players enable @a iarena_changep
scoreboard players set @a[scores={iarena_points=..-1}] iarena_points 0

# team joining
execute as @a[scores={iarena_teamT=0..}] run function improv_arenas:team_change
#execute as @a unless score @s iarena_teamT matches 0.. run scoreboard players set @s iarena_teamT -1
scoreboard players enable @a iarena_teamT

# underdog
execute as @e[scores={iarena_resetp=1..}] run function improv_arenas:features/reset_score
scoreboard players reset @e[scores={iarena_resetp=1..}] iarena_resetp


# check ready
function improv_arenas:pvp_ready