extends Node

class_name ListItem

var health_potion : Item = Item.new("Health Potion",
					"res://Assets/UI/Icon/item_potion.tres",
					ItemEffect.new(ItemEffectTypes.HEALTH_BOOST, 30)) setget , get_health_potion

var stage_1_key : Item = Item.new("Stage 1 Key",
								"res://Assets/UI/Icon/key.tres",
								ItemEffect.new(ItemEffectTypes.KEY, 1)) setget , get_stage_1_key

var stage_2_key : Item = Item.new("Stage 2 Key",
								"res://Assets/UI/Icon/key.tres",
								ItemEffect.new(ItemEffectTypes.KEY, 1)) setget , get_stage_2_key

var stage_3_key : Item = Item.new("Stage 3 Key",
								"res://Assets/UI/Icon/key.tres",
								ItemEffect.new(ItemEffectTypes.KEY, 1)) setget , get_stage_3_key

func get_health_potion() -> Item:
	return health_potion


func get_stage_1_key() -> Item:
	return stage_1_key

func get_stage_2_key() -> Item:
	return stage_2_key

func get_stage_3_key() -> Item:
	return stage_3_key
