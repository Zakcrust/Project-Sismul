extends Node2D

var FIRST_SPAWN_POSITION : Vector2 = Vector2(60,450)

var player_scene : PackedScene = load("res://Scenes/Character/Player.tscn")

signal flicker_done()

func _ready():
	for child in get_children():
		if child is Character:
			return
	spawn_player($Position2D.global_position)

func spawn_player(pos : Vector2) -> void:
	var player = player_scene.instance()
	player.position = pos
	add_child(player)

func show_ui() -> void:
	$GameUI/GameUI.show()

func hide_ui() -> void:
	$GameUI/GameUI.hide()


func register_children() -> void:
	for child in get_children():
		if child is Character:
			child.queue_free()
			continue
		child.owner = self

func fade_out() -> void:
	$TransitionScene.fade_out()

func transition_flicker() -> void:
	$TransitionScene.flicker()
	yield($TransitionScene/AnimationPlayer, "animation_finished")
	emit_signal("flicker_done")
	$TransitionScene/ColorRect.hide()
