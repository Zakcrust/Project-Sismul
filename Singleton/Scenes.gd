extends Node

class_name SceneList

const STAGE_1 = "STAGE_1"
const STAGE_2 = "STAGE_2"
const STAGE_3 = "STAGE_3"

var scene_list = {
	STAGE_1 : Scene.new("",""),
	STAGE_2 : Scene.new("", ""),
	STAGE_3 : Scene.new("", "")
}

func get_scene(scene_name : String) -> Scene:
	return scene_list[scene_name]
