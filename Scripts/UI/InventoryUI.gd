extends CanvasLayer

var selected_item_id : int = 0

var loaded_items : Array

signal done()
signal cancel()

func _ready():
#	add_item(PlayerData.inventory.items)
	get_tree().paused = true

func view_only() -> void:
	$InventoryUI/Button/HBoxContainer/Use.hide()

func add_item(items : Array) -> void:
	for item in items:
		$InventoryUI/Inventory/ItemList.add_item(item.item_name,load(item.item_asset_path))
		loaded_items.append(item)

func add_consumables(items : Array) -> void:
	for item in items:
		if item.item_effect.effect_type == ItemEffectTypes.KEY:
			continue
		$InventoryUI/Inventory/ItemList.add_item(item.item_name,load(item.item_asset_path))
		loaded_items.append(item)

func add_non_consumables(items : Array) -> void:
	for item in items:
		if item.item_effect.effect_type != ItemEffectTypes.KEY:
			continue
		$InventoryUI/Inventory/ItemList.add_item(item.item_name,load(item.item_asset_path))
		loaded_items.append(item)


func _on_Close_pressed():
	get_tree().paused = false
	emit_signal("cancel")
	queue_free()


func _on_ItemList_item_selected(index):
	selected_item_id = index
	print(index)
	$InventoryUI/Button/HBoxContainer/Use.disabled = false


func _on_Use_pressed():
	var selected_item = loaded_items[selected_item_id]
	BattleData.item_to_use = selected_item
	loaded_items.remove(selected_item_id)
	$InventoryUI/Inventory/ItemList.remove_item(selected_item_id)
	PlayerData.inventory.items.erase(selected_item)
	get_tree().paused = false
	emit_signal("done")
	queue_free()
