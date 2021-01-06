extends Node

class_name Scene

var scene_name : String
var default_scene_path : String
var saved_scene_path : String
var battle_scene : PackedScene

func _init(default_init : String, saved_init : String, battle_scene_init : PackedScene, name_init : String):
	default_scene_path = default_init
	saved_scene_path = saved_init
	battle_scene = battle_scene_init
	scene_name = name_init
