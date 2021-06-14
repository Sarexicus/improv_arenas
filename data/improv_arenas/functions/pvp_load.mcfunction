# setup scoreboard stuff
scoreboard objectives add kills playerKillCount "Kills"
scoreboard objectives setdisplay list kills
scoreboard objectives setdisplay belowName kills

scoreboard objectives add points dummy "Points"
execute as @a unless entity @s[scores={points=0..}] run scoreboard players set @s points 0

# triggers
scoreboard objectives add changepoint trigger
scoreboard objectives add pvp_teamTrigger trigger

# new ready up
scoreboard objectives add pvp_sneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add pvp_walk minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add pvp_sprint minecraft.custom:minecraft.sprint_one_cm
scoreboard players set round_in_progress misc 0

# round counter
scoreboard players set round misc 1 

# teams
function improv_arenas:load_teams

# kill/death check
scoreboard objectives add pvp_deathTrigger deathCount
scoreboard objectives add pvp_killTrigger playerKillCount
scoreboard objectives add pvp_healthCheck dummy
execute as @a store result score @s pvp_healthCheck run data get entity @s Health

# setup bossbar stuff
bossbar add improv_arenas:round_timer "Round X"
bossbar set improv_arenas:round_timer style notched_12
bossbar set improv_arenas:round_timer color green
bossbar set improv_arenas:round_timer max 2400

# extra features
execute unless score underdog_threshold cvar matches 0.. run scoreboard players set underdog_threshold cvar 3
execute unless score underdog_pointvalue cvar matches 0.. run scoreboard players set underdog_pointvalue cvar 1
execute unless score border_time cvar matches 0.. run scoreboard players set border_time cvar 3
execute unless score border_size cvar matches 0.. run scoreboard players set border_size cvar 96

scoreboard objectives add pvp_hasShield dummy

# tellraw for spawning
tellraw @a ["",{"text":"[improv_arenas]","color":"green"},{"text":" Loaded! ","color":"aqua"},{"text":"[Spawn Arena]","color":"yellow","clickEvent":{"action":"run_command","value":"/function improv_arenas:setup"}}]

