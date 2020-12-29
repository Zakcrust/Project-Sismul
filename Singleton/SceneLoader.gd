extends Node


var running_scene : PackedScene
var current_scene : Scene


var player_last_position : Vector2
var player : PackedScene = load("res://Scenes/Character/Player.tscn")

var scenes : SceneList = SceneList.new()
var directory = Directory.new()

func load_scene(scene : Scene, spawn_pos : Vector2):
	current_scene = scene
	if directory.file_exists(scene.saved_scene_path):
		var prev_scene = get_tree().current_scene
		running_scene = load(scene.saved_scene_path)
		var scene_instance = running_scene.instance()
		scene_instance.spawn_player(spawn_pos)
		get_tree().get_root().add_child(scene_instance)
		get_tree().current_scene = scene_instance
		get_tree().get_root().remove_child(prev_scene)
	else:
		var prev_scene = get_tree().current_scene
		running_scene = load(scene.default_scene_path)
		var scene_instance = running_scene.instance()
		scene_instance.spawn_player(spawn_pos)
		get_tree().get_root().add_child(scene_instance)
		get_tree().current_scene = scene_instance
		get_tree().get_root().remove_child(prev_scene)


func load_battle_scene(battlers : Array) -> void:
	var battler_scene_instance = current_scene.battle_scene.instance()
	get_tree().get_root().add_child(battler_scene_instance)
	battler_scene_instance.add_battlers(battlers)
	get_tree().current_scene = battler_scene_instance


func quit_battle_scene(win : bool) -> void:
	var children = get_tree().get_root().get_children()
	get_tree().current_scene = children[-2]
	get_tree().current_scene.spawn_player(player_last_position)
	get_tree().get_root().remove_child(children.back())
	
	if win:
		BattleData.enemy_character.queue_free()
		BattleData.enemy_character = null
