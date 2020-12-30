extends CanvasLayer

var inventory_ui : PackedScene = load("res://Scenes/UI/InventoryUI.tscn")

func _on_Inventory_pressed():
	add_child(inventory_ui.instance())
