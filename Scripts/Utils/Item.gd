extends Node

class_name Item

var item_name : String
var item_asset_path : String
var item_effect : ItemEffect

func _init(name_init : String, asset_path : String, effect : ItemEffect):
	item_name = name_init
	item_asset_path = asset_path
	item_effect = effect
