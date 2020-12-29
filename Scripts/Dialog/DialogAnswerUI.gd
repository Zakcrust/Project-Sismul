extends Control

signal send_answer(answer)


func set_answer_text(text : String) -> void:
	$Answer.text = text


func _on_Answer_pressed():
	emit_signal("send_answer", $Answer.text)
