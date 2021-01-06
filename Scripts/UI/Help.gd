extends Control

func _ready():
	get_tree().paused = true

func _on_Close_pressed():
	get_tree().paused = false
	queue_free()
