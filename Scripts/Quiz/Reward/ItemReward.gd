extends Node

class_name ItemReward

var item_name : String
var item_path : String
var sprite : Texture = Texture.new()
var reward : Reward

func _init(item_name_init : String, path : String, amount_init : int):
	item_name = item_name_init
	item_path = path
	sprite = load(item_path)
	reward = Reward.new(amount_init)
