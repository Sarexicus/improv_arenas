# set world border + spawn arena + save old terrain
worldborder center ~ ~
summon item_frame ~ ~ ~
execute at @e[type=item_frame,limit=1,sort=nearest] run summon minecraft:area_effect_cloud ~ ~ ~ {Duration:199980,Tags:["iarena_lobby"]}
kill @e[type=item_frame,limit=1,sort=nearest]
execute at @e[tag=iarena_lobby,limit=1] run function improv_arenas:structures/save_terrain
execute at @e[tag=iarena_lobby,limit=1] run function improv_arenas:structures/load_lobby

# set spawn stuff (prevents breakage)
spawnpoint @a ~6 ~1 ~
setworldspawn ~6 ~1 ~

#set gamerules + cvar
gamerule fallDamage true
gamerule spawnRadius 0

gamerule doMobSpawning false
gamerule doImmediateRespawn true
gamerule keepInventory true

#ensure stats arent bad
scoreboard players set @a iarena_sneak 0

# add move stats
function improv_arenas:load/load_move_stats

# teams
function improv_arenas:load_teams

# clear ender chests on reset
execute as @a run function improv_arenas:util/clear_enderchest

#give book
function improv_arenas:give_book

# reset stats
scoreboard players set @a iarena_points 0
scoreboard players set @a iarena_kills 0
scoreboard objectives setdisplay sidebar iarena_points
scoreboard players set round_in_progress iarena_var 0
scoreboard players set pause iarena_timer 0
scoreboard players set round iarena_var 1 