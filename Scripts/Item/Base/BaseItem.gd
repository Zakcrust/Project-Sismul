extends Item

export (String) var custom_item_name
export (String) var custom_item_path

func _init().("","",ItemEffect.new(ItemEffectTypes.HEALTH_BOOST,0)):
	pass

func _ready():
	item_name = custom_item_name
	item_asset_path = custom_item_path
