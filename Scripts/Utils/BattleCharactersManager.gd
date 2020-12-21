extends Node

class_name TurnQueue

var active_character : Node2D
var battlers : Array

func get_enemies() -> Array:
	var enemies : Array
	for child in get_children():
		if child is Enemy:
			enemies.append(child)
	return enemies


func initialize():
	active_character = get_child(0)
	battlers = get_battlers()	

func get_battlers():
	return get_children()


func play_turn():
	yield(active_character.play_turn, "completed")
	var new_index = (active_character.get_index() + 1) % get_child_count()
	active_character = get_child(new_index)

