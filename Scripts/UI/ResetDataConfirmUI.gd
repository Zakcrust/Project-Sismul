extends Control

signal ok

func _on_Yes_pressed():
	emit_signal("ok")
	queue_free()


func _on_No_pressed():
	queue_free()
