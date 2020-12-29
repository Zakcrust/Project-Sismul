extends Node

class_name Scene

var default_scene_path : String
var saved_scene_path : String
var battle_scene : PackedScene

func _init(default_init : String, saved_init : String, battle_scene_init : PackedScene):
	default_scene_path = default_init
	saved_scene_path = saved_init
	battle_scene = battle_scene_init
