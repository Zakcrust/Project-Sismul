extends Resource

class_name Item

var item_name : String setget , get_item_name
var item_asset_path : String setget , get_asset_path
var item_effect : ItemEffect setget , get_effect


func _init(name_init : String, asset_path : String, effect : ItemEffect):
	item_name = name_init
	item_asset_path = asset_path
	item_effect = effect

func get_item_name() -> String:
	return item_name

func get_asset_path() -> String:
	return item_asset_path

func get_effect() -> ItemEffect:
	return item_effect
