# worldborder from scoreboard
execute store result score border iarena_var run worldborder get
execute if score modify_border iarena_var matches 1 if score border iarena_var > set_border iarena_var run worldborder add -1
execute if score modify_border iarena_var matches 1 if score border iarena_var < set_border iarena_var run worldborder add 5
execute if score modify_border iarena_var matches 1 if score border iarena_var = set_border iarena_var run scoreboard players set modify_border iarena_var 0

# shield(s)
give @a[scores={iarena_hasShield=1..}] shield{Damage:272} 1
scoreboard players remove @a[scores={iarena_hasShield=1..}] iarena_hasShield 1

execute if score round_in_progress iarena_var matches 0 run function improv_arenas:lobby_tick
execute if score round_in_progress iarena_var matches 1 run function improv_arenas:arena_tick