extends Node

class_name StatReward

var stat_type : String
var sprite : Texture = Texture.new()
var reward : Reward

func _init(type : String, amount_init : int):
	reward = Reward.new(amount_init)
	stat_type = type
	sprite = load("res://Assets/UI/Icon/item_stats.tres")
