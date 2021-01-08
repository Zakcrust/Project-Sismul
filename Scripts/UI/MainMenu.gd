extends Control

var first_position = Vector2(1028, 126)

func _on_Play_pressed():
	SceneLoader.load_scenes()
	SceneLoader.load_scene(SceneLoader.scenes.get_scene(SceneLoader.scenes.STAGE_1), first_position)


func _on_Exit_pressed():
	get_tree().quit()


func _on_Options_pressed():
	add_child(load("res://Scenes/UI/OptionsUI.tscn").instance())
