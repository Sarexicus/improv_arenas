#> improv_arenas:features/reset_score

function improv_arenas:util/clear_enderchest
scoreboard players operation @s iarena_points = reset_value iarena_var
