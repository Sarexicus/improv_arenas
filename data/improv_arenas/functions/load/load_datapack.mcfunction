#> improv_arenas:load/load_datapack

#feature loads
execute unless data storage improv_arenas:storage {Setup:true} run function improv_arenas:load/first_time_load

# tellraw for spawning
tellraw @a ["",{"text":"[improv_arenas]","color":"green"},{"text":" Loaded! ","color":"aqua"},{"text":"[Spawn Arena]","color":"yellow","clickEvent":{"action":"run_command","value":"/function improv_arenas:setup_game"}}]

