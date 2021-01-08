extends Node2D

var player_scene : PackedScene = load("res://Scenes/Character/Player.tscn")

signal flicker_done()
signal fade_in_done()

func spawn_player(pos : Vector2) -> void:
	for child in get_children():
		if child is Character:
			child.activate()
			return
	var player = player_scene.instance()
	player.position = pos
	add_child(player) 

func show_ui() -> void:
	$GameUI/GameUI.show()

func hide_ui() -> void:
	$GameUI/GameUI.hide()

func fade_in() -> void:
	$TransitionScene.fade_in()
	yield($TransitionScene/AnimationPlayer, "animation_finished")
	emit_signal("fade_in_done")

func fade_out() -> void:
	$TransitionScene.fade_out()

func register_children() -> void:
	for child in get_children():
		if child is Character:
			child.queue_free()
			continue
		child.owner = self

func transition_flicker() -> void:
	$TransitionScene.flicker()
	yield($TransitionScene/AnimationPlayer, "animation_finished")
	emit_signal("flicker_done")
	$TransitionScene/ColorRect.hide()
