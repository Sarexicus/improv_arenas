#> improv_arenas:gameplay/pvp_death
#> context: player who died

execute if data storage improv_arenas:storage {debug:true} run say I died

tag @s add ia_died
tag @s add ia_legit

advancement revoke @s only improv_arenas:backend/pvp_death