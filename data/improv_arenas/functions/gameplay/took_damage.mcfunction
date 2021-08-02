#> improv_arenas:gameplay/took_damage

execute if data storage improv_arenas:storage {debug:true} run say Ouch!
execute store result score @s iarena_health run data get entity @s Health 1

# go to spectator mode if damage resulted in death
execute if entity @s[scores={iarena_health=..0}] if score round_in_progress iarena_var matches 1 run spawnpoint @s ~ ~ ~
execute if entity @s[scores={iarena_health=..0}] if score round_in_progress iarena_var matches 1 run gamemode spectator @s

# test for victory
execute if entity @s[scores={iarena_health=..0}] if score round_in_progress iarena_var matches 1 run schedule function improv_arenas:test_win 2t

advancement revoke @s only improv_arenas:backend/took_damage