#worldborder 
execute if score round_in_progress iarena_var matches 1 if score border_time iarena_cvar matches 1 run worldborder set 16 30
execute if score round_in_progress iarena_var matches 1 if score border_time iarena_cvar matches 2 run worldborder set 16 60
execute if score round_in_progress iarena_var matches 1 if score border_time iarena_cvar matches 3 run worldborder set 16 120
execute if score round_in_progress iarena_var matches 1 if score border_time iarena_cvar matches 4 run worldborder set 16 240

# start center movement
execute as @e[tag=iarena_lobby] at @s run summon armor_stand ~ 250 ~ {Tags:["iarena_center"],NoGravity:1b,Invisible:1b}

scoreboard players set pause iarena_timer 0