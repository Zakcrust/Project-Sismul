extends Node


var current_scene : PackedScene

var scenes : SceneList = SceneList.new()
var directory = Directory.new()

func load_scene(scene : Scene):
	if directory.file_exists(scene.saved_scene_path):
		var prev_scene = get_tree().current_scene
		current_scene = load(scene.saved_scene_path)
		var scene_instance = current_scene.instance()
		get_tree().get_root().add_child(scene_instance)
		get_tree().current_scene = scene_instance
		get_tree().get_root().remove_child(prev_scene)
	else:
		var prev_scene = get_tree().current_scene
		current_scene = load(scene.default_scene_path)
		var scene_instance = current_scene.instance()
		get_tree().get_root().add_child(scene_instance)
		get_tree().current_scene = scene_instance
		get_tree().get_root().remove_child(prev_scene)
