extends Node

var enemy_character : Node2D
var battle_reward 

var item_to_use : Item

func set_item(value) -> void:
	item_to_use = value 

func get_item() -> Item:
	return item_to_use
