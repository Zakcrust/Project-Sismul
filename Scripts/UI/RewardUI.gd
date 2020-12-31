extends CanvasLayer

func load_item(item_texture : Texture, item_name : String) -> void:
	$RewardUI/TextureProgress/Item/TextureRect.texture = item_texture
	$RewardUI/TextureProgress/ItemName.text = item_name
	pass

func _ready():
	get_tree().paused = true
	hide_all_children()
	$RewardUI/Tween.interpolate_property($RewardUI/TextureProgress, "value", 0, 100, 1.0)
	$RewardUI/Tween.start()
	yield($RewardUI/Tween, "tween_all_completed")
	show_all_children()

func hide_all_children() -> void:
	for child in $RewardUI/TextureProgress.get_children():
		child.hide()
		
func show_all_children() -> void:
	for child in $RewardUI/TextureProgress.get_children():
		child.show()


func _on_Ok_pressed():
	get_tree().paused = false
	queue_free()
