extends Node

class_name InventoryData

var potion = load("res://Scripts/Item/Potion.gd")

var items : Array = [
	potion.new(),
	potion.new(),
	potion.new()
] setget set_items, get_items

func get_items() -> Array:
	return items

func set_items(value) -> void:
	items = value
