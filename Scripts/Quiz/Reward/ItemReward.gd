extends Node

class_name ItemReward

var item : Item
var reward : Reward

func _init(item_init : Item, amount_init : int):
	item = item_init
	reward = Reward.new(amount_init)
