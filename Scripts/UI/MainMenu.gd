extends Control


func _on_Play_pressed():
	SceneLoader.load_scene(SceneLoader.scenes.get_scene(SceneLoader.scenes.STAGE_1))
