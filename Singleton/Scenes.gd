extends Node

class_name SceneList

var STAGE_1 = "STAGE_1" setget , get_stage_1
var STAGE_2 = "STAGE_2" setget , get_stage_2
var STAGE_3 = "STAGE_3" setget , get_stage_3

var scene_list = {
	STAGE_1 : Scene.new("res://Scenes/Map/DefaultScene/Stage1.tscn","res://Scenes/Map/SavedScene/Stage1.tscn"),
	STAGE_2 : Scene.new("res://Scenes/Map/DefaultScene/Stage2.tscn", "res://Scenes/Map/SavedScene/Stage2.tscn"),
	STAGE_3 : Scene.new("res://Scenes/Map/DefaultScene/Stage3.tscn", "res://Scenes/Map/SavedScene/Stage3.tscn")
}

func get_scene(scene_name : String) -> Scene:
	return scene_list[scene_name]

func get_stage_1() -> String:
	return STAGE_1

func get_stage_2() -> String:
	return STAGE_2
	
func get_stage_3() -> String:
	return STAGE_3
