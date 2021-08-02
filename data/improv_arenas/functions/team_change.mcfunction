#> improv_arenas:team_change

team leave @s[scores={iarena_teamT=0}] 
team join iarena_gold @s[scores={iarena_teamT=1}] 
team join iarena_green @s[scores={iarena_teamT=2}] 
team join iarena_blue @s[scores={iarena_teamT=3}] 
team join iarena_purple @s[scores={iarena_teamT=4}] 
team join iarena_red @s[scores={iarena_teamT=5}] 
team join iarena_spectator @s[scores={iarena_teamT=6}] 

scoreboard players set @s iarena_teamT -1

# remove spectators from sidebar
scoreboard players reset @a[team=iarena_spectator] iarena_points
#gamemode spectator @a[team=iarena_spectator]