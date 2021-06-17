#> improv_arenas:arena_tick

# spectating / win condition
execute if score round_in_progress iarena_var matches 1 run function improv_arenas:test_win

# iarena_timer
execute unless score pause iarena_timer matches 1 unless score global iarena_timer matches 0 run scoreboard players remove global iarena_timer 1
execute store result bossbar improv_arenas:round_timer value run scoreboard players get global iarena_timer
scoreboard players operation rounded iarena_timer = global iarena_timer
scoreboard players operation rounded iarena_timer /= 20 iarena_constant

# out of time? start glowing
execute if score global iarena_timer matches 0 run effect give @a glowing 1 1 true

# bossbar
bossbar set improv_arenas:round_timer name [{"text":"Round ","color":"white","bold":true},{"score":{"name":"round","objective":"iarena_var"},"color":"white","bold":true},{"text":": ","color":"reset","bold":false},{"score":{"name":"rounded","objective":"iarena_timer"},"bold":false},{"text":"s","bold":false},{"text":" [b ","bold":false},{"score":{"name":"border","objective":"iarena_var"},"bold":false},{"text":"]","bold":false}]
execute if score rounded iarena_timer matches 60 run bossbar set improv_arenas:round_timer color yellow
execute if score rounded iarena_timer matches 30 run bossbar set improv_arenas:round_timer color red

# center movement
execute as @e[tag=iarena_center] at @s if entity @e[tag=iarena_newcenter,distance=..0.1] run kill @s
execute as @e[tag=iarena_center] at @s facing entity @e[tag=iarena_newcenter,limit=1] feet run tp @s ^ ^ ^0.005
execute as @e[tag=iarena_center] at @s run worldborder center ~ ~