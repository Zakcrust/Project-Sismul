extends CanvasLayer


var dialog_type : DialogType = DialogType.new()

var dialog_answer : PackedScene = load("res://Scenes/Dialog/DialogAnswer.tscn")
var answer : String
var question_answers : Array

var current_dialog : Dialog
var dialog_count : int = 0

#var dialogue_test : Array = stage_1.get_dialogues()

var dialog_array : Array

signal next_dialog()
signal dialog_failed()
signal dialog_success()


#func _ready():
#	get_tree().paused = true


func load_dialog(dialogues : Array) -> void:
	dialog_array = dialogues
	for dialog in dialog_array:
		read_dialog(dialog)
		dialog_count += 1
		yield(self, "next_dialog")
	if dialog_array.empty():
		emit_signal("dialog_failed")
	else:
		emit_signal("dialog_success")
#	get_tree().paused = false
	queue_free()



func read_dialog(dialog : Dialog) -> void:
	clear_answers()
	$DialogContainer/HBoxContainer/Character.texture = load(dialog.dialog_sprite_path)
	$DialogContainer/HBoxContainer/CharacterName.text = dialog.dialog_character_name
	if dialog.dialog_type == dialog_type.STATEMENT:
		$DialogContainer/Statement.text = dialog.dialog_text
		$DialogContainer/Tween.interpolate_property($DialogContainer/Statement, "percent_visible", 0, 1.0, dialog.dialog_text.length() / 50.0)
		$DialogContainer/Tween.start()
		yield($DialogContainer/Tween, "tween_all_completed")
		$DialogContainer/Next.show()
	elif dialog.dialog_type == dialog_type.QUESTION:
#		$DialogContainer/HBoxContainer/CharacterName.text = dialog.dialog_character_name
		$DialogContainer/Statement.text = dialog.dialog_text
		$DialogContainer/Tween.interpolate_property($DialogContainer/Statement, "percent_visible", 0, 1.0, dialog.dialog_text.length() / 50.0)
		$DialogContainer/Tween.start()
		yield($DialogContainer/Tween, "tween_all_completed")
		for dialog_ans in dialog.dialog_question.question_answer:
			var answer_instance = dialog_answer.instance()
			if dialog_ans is DialogAnswer:
				answer_instance.set_answer_text(dialog_ans.dialog_answer)
				answer_instance.connect("send_answer", self, "check_answer")
				question_answers.append(dialog_ans)
				$DialogContainer/Answers.add_child(answer_instance)
	elif dialog.dialog_type == dialog_type.STATEMENT_END:
		$DialogContainer/HBoxContainer/CharacterName.text = dialog.dialog_character_name
		$DialogContainer/Statement.text = dialog.dialog_text
		$DialogContainer/Tween.interpolate_property($DialogContainer/Statement, "percent_visible", 0, 1.0, dialog.dialog_text.length() / 50.0)
		$DialogContainer/Tween.start()
		yield($DialogContainer/Tween, "tween_all_completed")
		$DialogContainer/Next.show()
		dialog_array.clear()

func check_answer(ans : String) -> void:
	print("Checking answer ...")
	for answers in question_answers:
		if ans == answers.dialog_answer:
			var first_position : int = dialog_count
			print("Dialogue position : %s" % first_position)
			for dialog in answers.next_dialog:
				dialog_array.insert(first_position,dialog)
				first_position += 1
				emit_signal("next_dialog")

func clear_answers() -> void:
	for child in $DialogContainer/Answers.get_children():
		child.queue_free()

func _on_Next_pressed():
	$DialogContainer/Next.hide()
	$DialogContainer/Statement.percent_visible = 0
	emit_signal("next_dialog")
