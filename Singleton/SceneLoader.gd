extends Node


var current_scene : PackedScene

var scenes = SceneList.new()
var directory = Directory.new()

func load_scene(scene : Scene):
	if directory.file_exists(scene.saved_scene_path):
		current_scene = load(scene.saved_scene_path)
		var scene_instance = current_scene.instance()
		get_tree().get_root().add_child(scene_instance)
		get_tree().current_scene = scene_instance
	else:
		current_scene = load(scene.default_scene_path)
		var scene_instance = current_scene.instance()
		get_tree().get_root().add_child(scene_instance)
		get_tree().current_scene = scene_instance
