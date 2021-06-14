#find the highest player's score
scoreboard players set #highest kills 0
scoreboard players operation #highest kills > @a kills

#subtract it by the threshold
scoreboard players operation #highest kills -= underdog_threshold cvar

#if there are any players below this threshold, give them extra points equal to underdog_pointvalue
execute as @a if score @s kills <= #highest kills run tag @s add underdog

#tellraw to announce underdog
execute if entity @a[tag=underdog] run tellraw @a ["",{"text":"[improv_arenas] ","color":"green"},{"text":"underdog: "},{"text":" Reset available for "},{"selector":"@a[tag=underdog]"}]
#cleanup
tag @a remove underdog