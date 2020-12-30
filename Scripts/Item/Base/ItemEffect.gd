extends Node

class_name ItemEffect

var effect_type : String
var amount : float

func _init(type : String, amount_init : float):
	effect_type = type
	amount = amount_init
