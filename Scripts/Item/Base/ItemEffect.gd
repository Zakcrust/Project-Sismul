extends Node

class_name ItemEffect

var effect_type : String
var amount : float
var turn_length : int
var is_buff : bool


func _init(type : String, amount_init : float, turn_init : int = 0, is_buff_init = false):
	effect_type = type
	amount = amount_init
	turn_length = turn_init
	is_buff = is_buff_init
