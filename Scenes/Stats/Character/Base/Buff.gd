extends Node

class_name Buff

var buff_type : String
var max_turn : int
var amount : int
var turn_count = 0



func _init(type : String, amount_init : int, turn : int):
	buff_type = type
	amount = amount_init
	max_turn = turn


func turn() -> void:
	turn_count += 1
	if turn_count >= max_turn:
		print("%s is expired and removed" % buff_type)
		queue_free()
