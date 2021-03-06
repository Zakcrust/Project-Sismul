extends Node

var default_stats : Stats = Stats.new(10, 10, 3, 2, 5)
var stats : Stats = Stats.new(10, 10, 3, 2, 5)
var inventory : Inventory = Inventory.new()
var inventory_data : InventoryData = load("res://Scripts/Utils/InventoryData/Default/InventoryData.tscn").instance()
var current_position : Vector2

func _ready():
	inventory.items = inventory_data.items
	print(inventory.items)

func add_reward(reward) -> void:
	if reward is ItemReward:
		redeem_item_reward(reward)
	elif reward is StatReward:
		redeem_stat_reward(reward)


func redeem_stat_reward(reward : StatReward) -> void:
	match reward.stat_type:
		StatType.HEALTH:
			stats.health += reward.reward.amount
		StatType.ARMOR:
			stats.armor += reward.reward.amount
		StatType.DAMAGE:
			stats.damage += reward.reward.amount
		StatType.ENERGY:
			stats.energy += reward.reward.amount

func redeem_item_reward(reward : ItemReward) -> void:
	if reward is ItemReward:
		for _i in range(0, reward.reward.amount):
			inventory.items.append(reward.item)


func reset() -> void:
	stats = default_stats
	inventory.items = inventory_data.items
	current_position = Vector2()
