extends CanvasLayer

signal take_quiz()
signal give_up()

func _ready():
	get_tree().paused = true


func _on_GiveUp_pressed():
	emit_signal("give_up")
	get_tree().paused = false
	queue_free()


func _on_TakeQuiz_pressed():
	emit_signal("take_quiz")
	get_tree().paused = false
	queue_free()
