# worldborder from scoreboard
execute store result score border misc run worldborder get
execute if score modify_border misc matches 1 if score border misc > set_border misc run worldborder add -1
execute if score modify_border misc matches 1 if score border misc < set_border misc run worldborder add 5
execute if score modify_border misc matches 1 if score border misc = set_border misc run scoreboard players set modify_border misc 0

# change points (use/refund)
execute as @a unless score @s changepoint matches 0 run scoreboard players operation @s points += @s changepoint
execute as @a unless score @s changepoint matches 0 run scoreboard players set @s changepoint 0
scoreboard players enable @a changepoint
scoreboard players set @a[scores={points=..-1}] points 0

# team joining
execute as @a unless score @s pvp_teamTrigger matches 0.. run scoreboard players set @s pvp_teamTrigger -1
scoreboard players enable @a pvp_teamTrigger
execute as @a[scores={pvp_teamTrigger=0..}] run function improv_arenas:team_change

# check ready
execute if score round_in_progress misc matches 0 run function improv_arenas:pvp_ready

# spectating / win condition
execute if score round_in_progress misc matches 1 run function improv_arenas:test_win

# timer
execute unless score pause timer matches 1 unless score global timer matches 0 run scoreboard players remove global timer 1
execute store result bossbar improv_arenas:round_timer value run scoreboard players get global timer
scoreboard players operation rounded timer = global timer
scoreboard players operation rounded timer /= 20 timer

# shield(s)
give @a[scores={pvp_hasShield=1..}] shield{Damage:288} 1
scoreboard players remove @a[scores={pvp_hasShield=1..}] pvp_hasShield 1

# custom items
function improv_arenas:features/custom_items

# out of time? start glowing
execute if score global timer matches 0 run effect give @a glowing 1 1 true

# bossbar
bossbar set improv_arenas:round_timer name [{"text":"Round ","color":"white","bold":true},{"score":{"name":"round","objective":"misc"},"color":"white","bold":true},{"text":": ","color":"reset","bold":false},{"score":{"name":"rounded","objective":"timer"},"bold":false},{"text":"s","bold":false},{"text":" [b ","bold":false},{"score":{"name":"border","objective":"misc"},"bold":false},{"text":"]","bold":false}]
execute if score rounded timer matches 60 run bossbar set improv_arenas:round_timer color yellow
execute if score rounded timer matches 30 run bossbar set improv_arenas:round_timer color red

