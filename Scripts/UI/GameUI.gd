extends CanvasLayer

var inventory_ui : PackedScene = load("res://Scenes/UI/InventoryUI.tscn")

func _on_Inventory_pressed():
	add_child(inventory_ui.instance())


func _on_Sound_toggled(button_pressed):
	if button_pressed:
		$GameUI/HBoxContainer/Sound.text = "Sound : OFF"
	else:
		$GameUI/HBoxContainer/Sound.text = "Sound : ON"


func _on_Music_toggled(button_pressed):
	if button_pressed:
		$GameUI/HBoxContainer/Music.text = "Music : OFF"
	else:
		$GameUI/HBoxContainer/Music.text = "Music : ON"
