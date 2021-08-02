#> improv_arenas:test_win
#> test for wins (i.e. no other players alive)

# win condition
execute if entity @a[team=iarena_gold] unless entity @a[team=!iarena_gold,gamemode=!spectator] run function improv_arenas:start/finish_round
execute if entity @a[team=iarena_green] unless entity @a[team=!iarena_green,gamemode=!spectator] run function improv_arenas:start/finish_round
execute if entity @a[team=iarena_blue] unless entity @a[team=!iarena_blue,gamemode=!spectator] run function improv_arenas:start/finish_round
execute if entity @a[team=iarena_purple] unless entity @a[team=!iarena_purple,gamemode=!spectator] run function improv_arenas:start/finish_round
execute if entity @a[team=iarena_red] unless entity @a[team=!iarena_red,gamemode=!spectator] run function improv_arenas:start/finish_round

# no-team win condition (only one player left alive)
execute unless data storage improv_arenas:storage {debug:1b} store result storage improv_arenas:storage PlayersAlive int 1 if entity @a[gamemode=!spectator]
execute if data storage improv_arenas:storage {PlayersAlive:1} run function improv_arenas:start/finish_round

# check if everyone is dead
execute if data storage improv_arenas:storage {PlayersAlive:0} run function improv_arenas:start/finish_round