extends Node

class_name Scene

var default_scene_path : String
var saved_scene_path : String

func _init(default_init : String, saved_init : String):
	default_scene_path = default_init
	saved_scene_path = saved_init
