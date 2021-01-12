extends Control

var first_position = Vector2(1028, 126)
var second_position = Vector2(185,860)
var third_position = Vector2(385,70)

func _on_Play_pressed():
	SceneLoader.load_scenes()
	if SceneLoader.current_scene_name == "":
		SceneLoader.load_scene(SceneLoader.scenes.get_scene(SceneLoader.scenes.STAGE_1), first_position)
	else:
		SceneLoader.load_scene(SceneLoader.scenes.get_scene(SceneLoader.current_scene_name), PlayerData.current_position)


func _on_Exit_pressed():
	get_tree().quit()


func _on_Options_pressed():
	add_child(load("res://Scenes/UI/OptionsUI.tscn").instance())
