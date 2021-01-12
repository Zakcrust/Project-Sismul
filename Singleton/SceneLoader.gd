extends Node

var current_scene : Scene
var current_scene_name : String = ""
var battle_scene : PackedScene

var player_last_position : Vector2
var player : PackedScene = load("res://Scenes/Character/Player.tscn")

var scenes : SceneList = SceneList.new()

var available_stages : Array

var directory = Directory.new()

var STAGE_1 = load(scenes.get_scene(scenes.STAGE_1).default_scene_path).instance()
var STAGE_2 = load(scenes.get_scene(scenes.STAGE_2).default_scene_path).instance()
var STAGE_3 = load(scenes.get_scene(scenes.STAGE_3).default_scene_path).instance()

func _ready():
	available_stages.append(STAGE_1)
	available_stages.append(STAGE_2)
	available_stages.append(STAGE_3)


func load_scene(scene : Scene, _spawn_pos : Vector2 = Vector2()):
	current_scene = scene
	var running_scene = get_tree().get_root().get_children().back()
#	if running_scene.has_method("fade_in"):
#		running_scene.fade_in()
#		yield(running_scene, "fade_in_done")
	get_tree().get_root().remove_child(running_scene)
	current_scene_name = scene.scene_name
	match(scene.scene_name):
		scenes.STAGE_1:
			for child in get_tree().get_root().get_children():
				if child == STAGE_1:
					get_tree().current_scene = STAGE_1
					get_tree().current_scene.fade_out()
					return
			get_tree().get_root().add_child(STAGE_1)
			get_tree().current_scene = STAGE_1
		scenes.STAGE_2:
			for child in get_tree().get_root().get_children():
				if child == STAGE_2:
					get_tree().current_scene = STAGE_2
					get_tree().current_scene.fade_out()
			get_tree().get_root().add_child(STAGE_2)
			get_tree().current_scene = STAGE_2
		scenes.STAGE_3:
			for child in get_tree().get_root().get_children():
				if child == STAGE_3:
					get_tree().current_scene = STAGE_3
					return
			get_tree().get_root().add_child(STAGE_3)
			get_tree().current_scene = STAGE_3
	get_tree().current_scene.spawn_player(_spawn_pos)
#		var prev_scene = get_tree().current_scene
#		running_scene = load(scene.saved_scene_path)
#		var scene_instance = running_scene.instance()
#		scene_instance.spawn_player(spawn_pos)
#		get_tree().get_root().add_child(scene_instance)
#		get_tree().current_scene = scene_instance
#		get_tree().get_root().remove_child(prev_scene)
#	else:
#		var prev_scene = get_tree().current_scene
#		running_scene = load(scene.default_scene_path)
#		var scene_instance = running_scene.instance()
#		scene_instance.spawn_player(spawn_pos)
#		get_tree().get_root().add_child(scene_instance)
#		get_tree().current_scene = scene_instance
#		get_tree().get_root().remove_child(prev_scene)


func load_battle_scene(battlers : Array) -> void:
	var battler_scene_instance = current_scene.battle_scene.instance()
	get_tree().get_root().add_child(battler_scene_instance)
	battler_scene_instance.add_battlers(battlers)
	get_tree().current_scene = battler_scene_instance


func quit_battle_scene(win : bool) -> void:
	SoundAndMusic.play_music(SoundAndMusic.PEKORA_BGM)
	var children = get_tree().get_root().get_children()
	var current_battle_scene = children.pop_back()
	get_tree().get_root().remove_child(current_battle_scene)
	current_battle_scene.queue_free()
#	get_tree().current_scene = children[-2]
	get_tree().current_scene = get_tree().get_root().get_children().back()
	get_tree().current_scene.spawn_player(player_last_position)
	get_tree().current_scene.show_ui()
	if win:
		BattleData.enemy_character.queue_free()
		BattleData.enemy_character = null

func load_scenes() -> void:
	var dir : Directory = Directory.new()
	
	if dir.file_exists(scenes.get_scene(scenes.STAGE_1).saved_scene_path):
		STAGE_1 = load(scenes.get_scene(scenes.STAGE_1).saved_scene_path).instance()
	else:
		STAGE_1 = load(scenes.get_scene(scenes.STAGE_1).default_scene_path).instance()
		
	if dir.file_exists(scenes.get_scene(scenes.STAGE_2).saved_scene_path):
		STAGE_2 = load(scenes.get_scene(scenes.STAGE_2).saved_scene_path).instance()
	else:
		STAGE_2 = load(scenes.get_scene(scenes.STAGE_2).default_scene_path).instance()
		
	if dir.file_exists(scenes.get_scene(scenes.STAGE_3).saved_scene_path):
		STAGE_3 = load(scenes.get_scene(scenes.STAGE_3).saved_scene_path).instance()
	else:
		STAGE_3 = load(scenes.get_scene(scenes.STAGE_3).default_scene_path).instance()


func save_scenes() -> void:
	var counter = 0
	for stage in available_stages:
		counter += 1
		if not stage.is_inside_tree():
			continue
		stage.register_children()
		var packed_scene : PackedScene = PackedScene.new()
		packed_scene.pack(stage)
		ResourceSaver.save("res://Scenes/Map/SavedScene/Stage%s.tscn" % counter, packed_scene)

func reset() -> void:
	var dir : Directory = Directory.new()
	for i in range(1, available_stages.size() + 1):
		if dir.file_exists("res://Scenes/Map/SavedScene/Stage%s.tscn" % i):
			dir.remove("res://Scenes/Map/SavedScene/Stage%s.tscn" % i)
	current_scene_name = ""
