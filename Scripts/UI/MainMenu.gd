extends Control

func _on_Play_pressed():
	SceneLoader.load_scene(SceneLoader.scenes.get_scene(SceneLoader.scenes.STAGE_1))


func _on_Exit_pressed():
	get_tree().quit()


func _on_Options_pressed():
	add_child(load("res://Scenes/UI/OptionsUI.tscn").instance())
