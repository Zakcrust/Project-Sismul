extends Control

var first_position = Vector2(1028, 126)
var second_position = Vector2(185,860)
var third_position = Vector2(385,70)


func _on_Play_pressed():
	SceneLoader.load_scenes()
	SceneLoader.load_scene(SceneLoader.scenes.get_scene(SceneLoader.scenes.STAGE_1), first_position)
#	SceneLoader.load_scene(SceneLoader.scenes.get_scene(SceneLoader.scenes.STAGE_2), second_position)
#	SceneLoader.load_scene(SceneLoader.scenes.get_scene(SceneLoader.scenes.STAGE_3), third_position)


func _on_Exit_pressed():
	get_tree().quit()


func _on_Options_pressed():
	add_child(load("res://Scenes/UI/OptionsUI.tscn").instance())
