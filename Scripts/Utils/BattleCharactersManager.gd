extends Node

class_name TurnQueue

var active_character : Node2D
var battlers : Array

signal send_to_dead_pool(obj)
signal set_post_battle_ui(value)


func get_enemies() -> Array:
	var enemies : Array
	for child in get_children():
		if child.is_in_group("Enemy"):
			if child.get_current_state() != "Dead":
				enemies.append(child)
	return enemies

func get_players() -> Array:
	var players : Array
	for child in get_children():
		if child.is_in_group("Player"):
			if child.get_current_state() != "Dead":
				players.append(child)
	return players


func initialize():
	if get_child_count() == 0:
		return
	active_character = get_child(0)
	battlers = get_battlers()
	for battler in battlers:
		battler.connect("end_turn", self, "play_turn")
	print("Current turn : %s" % active_character.name)
	active_character.play_turn()

func get_battlers():
	return get_children()


func play_turn():
	if not living_enemies():
		victory()
		return
	elif not living_player():
		defeat()
		return
	var new_index = (active_character.get_index() + 1) % get_child_count()
	active_character = get_child(new_index)
	while(active_character.get_current_state() == "Dead"):
		new_index = (active_character.get_index() + 1) % get_child_count()
		pass
	print("Current turn : %s" % active_character.name)
	active_character.play_turn()


func living_enemies() -> bool:
	for child in get_children():
		if child.is_in_group("Enemy"):
			if child.get_current_state() != "Dead":
				return true
	return false

func victory() -> void:
	for child in get_children():
		if child.is_in_group("Player"):
			child.victory()
	emit_signal("set_post_battle_ui", "Victory")
	leave_scene(true)

func defeat() -> void:
	for child in get_children():
		if child.is_in_group("Enemy"):
			child.victory()
	emit_signal("set_post_battle_ui", "Defeat")
	leave_scene(false)

func leave_scene(win : bool) -> void:
	yield(get_tree().create_timer(2.0), "timeout")
	SceneLoader.quit_battle_scene(win)

func living_player() -> bool:
	for child in get_children():
		if child.is_in_group("Player"):
			if child.get_current_state() != "Dead":
				return true
	return false
