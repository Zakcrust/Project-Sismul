extends Area2D

var player : Character

export (Vector2) var target_spawn_position

export (String, "STAGE_1", "STAGE_2", "STAGE_3" ) var stage 

var scene_list = SceneList.new()


func travel() -> void:
	SceneLoader.load_scene(scene_list.get_scene(stage), target_spawn_position)


func _on_Gateway_body_entered(body):
	if body is Character:
		player = body
		player.object_to_interact = self
		$CanvasLayer/Leave.show()


func _on_Gateway_body_exited(body):
	if body is Character:
		player.object_to_interact = null
		player = null
		$CanvasLayer/Leave.hide()
