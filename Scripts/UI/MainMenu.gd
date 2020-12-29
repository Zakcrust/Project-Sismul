extends Control

var FIRST_SPAWN_POSITION : Vector2 = Vector2(60,450)

func _on_Play_pressed():
	SceneLoader.load_scene(SceneLoader.scenes.get_scene(SceneLoader.scenes.STAGE_1), FIRST_SPAWN_POSITION)


func _on_Exit_pressed():
	get_tree().quit()
