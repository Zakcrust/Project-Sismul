extends CanvasLayer

var inventory_ui : PackedScene = load("res://Scenes/UI/InventoryUI.tscn")

func _on_Inventory_pressed():
	var instance = inventory_ui.instance()
	instance.view_only()
	instance.add_non_consumables(PlayerData.inventory.items)
	instance.add_item(PlayerData.inventory.items)
	add_child(instance)


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


func _on_Options_pressed():
	add_child(load("res://Scenes/UI/OptionsUI.tscn").instance())


func _on_Help_pressed():
	add_child(load("res://Scenes/UI/HelpUI.tscn").instance())


func _on_SaveAndQuit_pressed():
	SceneLoader.save_scenes()
	get_tree().change_scene("res://Scenes/UI/MainMenu.tscn")


func _on_QuitWithoutSaving_pressed():
	get_tree().change_scene("res://Scenes/UI/MainMenu.tscn")
