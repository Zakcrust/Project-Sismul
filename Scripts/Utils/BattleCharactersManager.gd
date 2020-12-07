extends Node2D


func get_enemies() -> Array:
	var enemies : Array
	for child in get_children():
		if child is Enemy:
			enemies.append(child)
	return enemies
