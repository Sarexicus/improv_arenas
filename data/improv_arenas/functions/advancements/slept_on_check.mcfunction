#> improv_arenas:advancements/slept_on_check
#> context: player sleeping
say bed

execute if entity @s[team=iarena_gold] if entity @a[team=!iarena_gold,distance=..10] run tag @s add ia_bed 
execute if entity @s[team=iarena_green] if entity @a[team=!iarena_green,distance=..10] run tag @s add ia_bed 
execute if entity @s[team=iarena_blue] if entity @a[team=!iarena_blue,distance=..10] run tag @s add ia_bed 
execute if entity @s[team=iarena_purple] if entity @a[team=!iarena_purple,distance=..10] run tag @s add ia_bed 
execute if entity @s[team=iarena_red] if entity @a[team=!iarena_red,distance=..10] run tag @s add ia_bed 
execute if entity @s[team=] if entity @a[distance=0.5..10] run tag @s add ia_bed

execute if entity @s[tag=ia_bed] run advancement grant @s only improv_arenas:challenges/slept_on
execute if entity @s[tag=!ia_bed] run advancement revoke @s only improv_arenas:challenges/slept_on_check

tag @s remove ia_bed