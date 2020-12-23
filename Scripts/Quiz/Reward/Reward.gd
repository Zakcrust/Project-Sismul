extends Node

class_name Reward

var amount : int setget , get_amount

func _init(amount_init : int):
	amount = amount_init

func get_amount() -> int:
	return amount
