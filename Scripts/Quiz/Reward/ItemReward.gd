extends Node

class_name ItemReward

var item : Item setget , get_item
var reward : Reward setget , get_reward

func _init(item_init : Item, amount_init : int):
	item = item_init
	reward = Reward.new(amount_init)

func get_item() -> Item:
	return item
	
func get_reward() -> Reward:
	return reward
