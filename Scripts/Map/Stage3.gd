extends Node2D

var player_scene : PackedScene = load("res://Scenes/Character/Player.tscn")

func spawn_player(pos : Vector2) -> void:
	var player = player_scene.instance()
	player.position = pos
	add_child(player)

func show_ui() -> void:
	$GameUI/GameUI.show()

func hide_ui() -> void:
	$GameUI/GameUI.hide()

func fade_out() -> void:
	$TransitionScene.fade_out()

func register_children() -> void:
	for child in get_children():
		if child is Character:
			child.queue_free()
			continue
		child.owner = self
