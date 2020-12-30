extends Node2D

var FIRST_SPAWN_POSITION : Vector2 = Vector2(60,450)

var player_scene : PackedScene = load("res://Scenes/Character/Player.tscn")

func spawn_player(pos : Vector2) -> void:
	var player = player_scene.instance()
	player.position = pos
	add_child(player)


func _on_Stage1_tree_exiting():
	pass # Replace with function body.
