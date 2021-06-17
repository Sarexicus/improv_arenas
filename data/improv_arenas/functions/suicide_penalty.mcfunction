#> improv_arenas:suicide_penalty
#> context: player who suicided

scoreboard players add @s iarena_suicides 1
tag @s add iarena_suicide
advancement revoke @s only improv_arenas:non_player_death