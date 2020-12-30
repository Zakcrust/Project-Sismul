extends Item

export (String) var custom_item_name
export (String) var custom_item_path

func _init().("Potion","res://Assets/UI/Icon/item_potion.tres",
			ItemEffect.new(ItemEffectTypes.HEALTH_BOOST,5)):
	pass

func _ready():
	item_name = custom_item_name
	item_asset_path = custom_item_path
