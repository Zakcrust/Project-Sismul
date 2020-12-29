extends CanvasLayer


var dialog_type : DialogType = DialogType.new()

var dialogue_test : Array = [
	Dialog.new("Player","res://Assets/Sprites/chars/CloseUp/Player/player_normal.png",
				"Ini adalah contoh kalimat percakapan 1.  pernyataan dimiliki oleh character di atas",
				dialog_type.STATEMENT),
	Dialog.new("Player","res://Assets/Sprites/chars/CloseUp/Player/player_normal.png",
				"Ini adalah contoh kalimat percakapan 2. pernyataan dimiliki oleh character di atas",
				dialog_type.STATEMENT),
	Dialog.new("Player","res://Assets/Sprites/chars/CloseUp/Player/player_normal.png",
				"Ini adalah contoh kalimat percakapan 3. pernyataan dimiliki oleh character di atas",
				dialog_type.STATEMENT),
	Dialog.new("Player","res://Assets/Sprites/chars/CloseUp/Player/player_normal.png",
				"Ini adalah contoh kalimat percakapan 4. pernyataan dimiliki oleh character di atas",
				dialog_type.STATEMENT),
	Dialog.new("Player","res://Assets/Sprites/chars/CloseUp/Player/player_normal.png",
				"Ini adalah contoh kalimat percakapan 5. pernyataan dimiliki oleh character di atas",
				dialog_type.STATEMENT)
]

var dialog_array : Array

signal next_dialog()
signal dialog_done()

func _ready():
	load_dialog(dialogue_test)


func load_dialog(dialogues : Array) -> void:
	dialog_array = dialogues
	for dialog in dialog_array:
		read_dialog(dialog)
		yield(self, "next_dialog")
	emit_signal("dialog_done")
	queue_free()



func read_dialog(dialog : Dialog) -> void:
	if dialog.dialog_type == dialog_type.STATEMENT:
		$DialogContainer/HBoxContainer/CharacterName.text = dialog.dialog_character_name
		$DialogContainer/Statement.text = dialog.dialog_text
		$DialogContainer/Tween.interpolate_property($DialogContainer/Statement, "percent_visible", 0, 1.0, 1.5)
		$DialogContainer/Tween.start()
		yield($DialogContainer/Tween, "tween_all_completed")
		$DialogContainer/Next.show()
	elif dialog.dialog_type == dialog_type.QUESTION:
		pass


func _on_Next_pressed():
	$DialogContainer/Next.hide()
	$DialogContainer/Statement.percent_visible = 0
	emit_signal("next_dialog")
