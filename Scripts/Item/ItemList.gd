extends Node

class_name ListItem

var health_potion : Item = Item.new("Health Potion",
					"res://Assets/UI/Icon/item_potion.tres",
					ItemEffect.new(ItemEffectTypes.HEALTH_BOOST, 30)) setget , get_health_potion

func get_health_potion() -> Item:
	return health_potion
