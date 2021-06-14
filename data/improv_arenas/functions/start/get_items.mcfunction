# give items from ender chest
execute at @e[tag=pvp_lobby,limit=1] run data modify block ~-6 ~ ~-1 Items set from entity @s EnderItems
execute at @e[tag=pvp_lobby,limit=1] run loot give @s mine ~-6 ~ ~-1 air{drop_contents:1b}
execute as @s store result score @s pvp_hasShield run clear @s shield
tag @s add has_items

#get the next person
execute as @r[tag=!has_items] run function sarex_pvp:start/get_items
#execute unless entity @a[tag=!has_items] run tag @a remove has_items