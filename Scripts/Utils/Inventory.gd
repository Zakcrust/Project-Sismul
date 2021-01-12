extends Resource

class_name Inventory

var items : Array setget set_items , get_items

func load_items(array_of_item : Array) -> void:
	for item in array_of_item:
		items.append(item)

func add_item(item : Item) -> void:
	items.append(item)

func set_items(value) -> void:
	items = value

func get_items() -> Array:
	return items

func remove_item(item : Item) -> void:
	items.erase(item)
