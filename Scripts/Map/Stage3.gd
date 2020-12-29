extends Node2D

var player_scene : PackedScene = load("res://Scenes/Character/Player.tscn")

func spawn_player(pos : Vector2) -> void:
	var player = player_scene.instance()
	player.position = pos
	add_child(player) 