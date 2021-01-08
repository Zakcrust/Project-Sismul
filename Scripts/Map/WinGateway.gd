extends Area2D

var player : Character


func travel() -> void:
	get_tree().change_scene("res://Scenes/UI/GameOverUI.tscn")


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
