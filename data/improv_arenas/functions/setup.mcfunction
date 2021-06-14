# set world border + spawn arena + save old terrain
worldborder center ~ ~
summon item_frame ~ ~ ~
execute at @e[type=item_frame,limit=1,sort=nearest] run summon minecraft:area_effect_cloud ~ ~ ~ {Duration:199980,Tags:["pvp_lobby"]}
kill @e[type=item_frame,limit=1,sort=nearest]
execute at @e[tag=pvp_lobby,limit=1] run function improv_arenas:structures/save_terrain
execute at @e[tag=pvp_lobby,limit=1] run function improv_arenas:structures/load_lobby

# set spawn stuff (prevents breakage)
spawnpoint @a ~6 ~1 ~
setworldspawn ~6 ~1 ~

#set gamerules + cvar
gamerule fallDamage true
gamerule spawnRadius 0
scoreboard players set pvp_enable cvar 1

#ensure stats arent bad
scoreboard players set @a pvp_sneak 0

#give book
function improv_arenas:give_book

# reset stats
scoreboard players set @a kills 0
scoreboard players set @a points 0
scoreboard objectives setdisplay sidebar points