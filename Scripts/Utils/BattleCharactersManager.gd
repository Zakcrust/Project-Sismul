extends Node

class_name TurnQueue

var active_character : Node2D
var battlers : Array

var reward_ui : PackedScene = load("res://Scenes/UI/RewardUI.tscn")

var player_ref

#signal send_to_dead_pool(obj)
signal set_post_battle_ui(value)


func get_enemies() -> Array:
	var enemies : Array = []
	for child in get_children():
		if child.is_in_group("Enemy"):
			if child.get_current_state() != "Dead":
				enemies.append(child)
	return enemies

func get_players() -> Array:
	var players : Array = []
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
	battlers.sort_custom(self, "sort_battlers")
	for battler in battlers:
		battler.connect("end_turn", self, "play_turn")
	print("Current turn : %s" % active_character.name)
	active_character.play_turn()
	active_character.show_pointer()

func get_battlers():
	return get_children()

func play_turn():
	if not living_enemies():
		victory()
		return
	elif not living_player():
		last_chance()
		return
	var new_index = (active_character.get_index() + 1) % get_child_count()
	active_character = get_child(new_index)
	while(active_character.get_current_state() == "Dead"):
		print("Object is already dead.. finding another object..")
		new_index = (active_character.get_index() + 1) % get_child_count()
		active_character = get_child(new_index)
		pass
	print("Current turn : %s" % active_character.name)
	active_character.play_turn()
	active_character.show_pointer()


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

func last_chance() -> void:
	var last_chance_ui = load("res://Scenes/UI/PlayerDownUI.tscn").instance()
	last_chance_ui.connect("give_up", self, "defeat")
	last_chance_ui.connect("take_quiz", self, "take_quiz")
	add_child(last_chance_ui)


func take_quiz() -> void:
	var quiz_ui = load("res://Scenes/Quiz/QuizUI.tscn").instance()
	quiz_ui.connect("correct", player_ref, "revive")
	quiz_ui.connect("wrong", self , "defeat")
	get_parent().get_node("CanvasLayer").add_child(quiz_ui)
	

func defeat() -> void:
	for child in get_children():
		if child.is_in_group("Enemy"):
			child.victory()
	emit_signal("set_post_battle_ui", "Defeat")
	leave_scene(false)

func leave_scene(win : bool) -> void:
	yield(get_tree().create_timer(1.0), "timeout")
	if win:
		emit_signal("set_post_battle_ui", "")
		var reward_ui_instance = reward_ui.instance()
		var reward = BattleData.battle_reward
		PlayerData.add_reward(reward)
		if reward is ItemReward:
			reward_ui_instance.load_item(load(reward.item.item_asset_path), reward.item.item_name + " x%s" % reward.reward.amount)
		elif reward is StatReward:
			reward_ui_instance.load_item(load(reward.sprite_path), reward.stat_type + " +%s" % reward.reward.amount)
		add_child(reward_ui_instance)
		yield(reward_ui_instance,"tree_exited")
		var transition = get_parent().get_node("TransitionScene")
		transition.fade_in()
		yield(transition.get_node("AnimationPlayer"), "animation_finished")
		SceneLoader.quit_battle_scene(win)
	else:
		var transition = get_parent().get_node("TransitionScene")
		transition.fade_in()
		yield(transition.get_node("AnimationPlayer"), "animation_finished")
		SceneLoader.quit_battle_scene(win)

func living_player() -> bool:
	for child in get_children():
		if child.is_in_group("Player"):
			if child.get_current_state() != "Dead":
				return true
	return false
