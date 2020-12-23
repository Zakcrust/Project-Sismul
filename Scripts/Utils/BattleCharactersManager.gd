extends Node

class_name TurnQueue

var active_character : Node2D
var battlers : Array

signal send_to_dead_pool(obj)

func _ready():
	initialize()


func get_enemies() -> Array:
	var enemies : Array
	for child in get_children():
		if child is Enemy:
			enemies.append(child)
	return enemies

func get_players() -> Array:
	var players : Array
	for child in get_children():
		if child is Player:
			players.append(child)
	return players


func initialize():
	active_character = get_child(0)
	battlers = get_battlers()
	for battler in battlers:
		battler.connect("end_turn", self, "play_turn")
	print("Current turn : %s" % active_character.name)
	active_character.play_turn()

func get_battlers():
	return get_children()


func play_turn():
	
	var new_index = (active_character.get_index() + 1) % get_child_count()
	active_character = get_child(new_index)
	print("Current turn : %s" % active_character.name)
	active_character.play_turn()
	
#	battlers = get_battlers()
#	if battlers.size() > 0:
#		play_turn()
#	else:
#		return
#
