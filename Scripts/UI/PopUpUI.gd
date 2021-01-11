extends CanvasLayer

signal closed()

func _ready():
	get_tree().paused = true

func set_text(text : String) -> void:
	$PopUpUI/PopUpText.text = text


func _on_Ok_pressed():
	get_tree().paused = false
	emit_signal("closed")
	queue_free()
