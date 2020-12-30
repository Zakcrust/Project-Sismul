extends Node

class_name StatReward

var stat_type : String
var sprite_path : String
var reward : Reward

func _init(type : String, amount_init : int):
	reward = Reward.new(amount_init)
	stat_type = type
	sprite_path = "res://Assets/UI/Icon/item_stats.tres"


func get_stat_type() -> String:
	return stat_type


func get_sprite_path() -> String:
	return sprite_path


func get_reward() -> Reward:
	return reward
