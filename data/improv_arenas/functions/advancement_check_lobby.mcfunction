#> improv_arenas:advancement_check_lobby

execute if score round iarena_var matches 9.. run advancement grant @a[tag=!ia_spentpoint,scores={iarena_points=10..}] only improv_arenas:challenges/diamond_hands

execute as @a[tag=ia_survivor] unless score @s iarena_echest matches 1.. run advancement grant @s only improv_arenas:challenges/super_survivalist
