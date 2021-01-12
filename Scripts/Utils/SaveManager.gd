extends Node

var save_path : String = "res://save_game.tres"

func _ready():
	if has_save():
		load_save()

func save() -> void:
	var save_game = SaveGame.new()
	save_game.game_version = ProjectSettings.get_setting("application/config/version")
	save_game.data = {
		"player_items" : PlayerData.inventory.items,
		"player_stats" : PlayerData.stats,
		"player_current_position" : [PlayerData.current_position.x, PlayerData.current_position.y],
		"player_current_scene" : SceneLoader.current_scene_name
	}
	SceneLoader.save_scenes()
	ResourceSaver.save(save_path, save_game)

func load_save() -> void:
	var load_game = ResourceLoader.load(save_path)
	PlayerData.inventory.items = load_game.data["player_items"]
	PlayerData.stats = load_game.data["player_stats"]
	PlayerData.current_position = Vector2(load_game.data["player_current_position"][0], load_game.data["player_current_position"][1])
	SceneLoader.current_scene_name = load_game.data["player_current_scene"]


func has_save() -> bool:
	return Directory.new().file_exists(save_path)


func remove_save() -> void:
	var dir : Directory = Directory.new()
	if dir.file_exists(save_path):
		PlayerData.reset()
		SceneLoader.reset()
		dir.remove(save_path)
