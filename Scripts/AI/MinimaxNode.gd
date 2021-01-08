extends Node

class_name MinimaxNode

var state : int setget , get_state
var score : int setget , get_score
var is_maximizer : bool setget , get_maximizer

func _init(state_init : int = 0, score_init : int = 0, maximizer_init : bool = false):
	state = state_init
	score = score_init
	is_maximizer = maximizer_init

func get_state() -> int:
	return state

func get_score() -> int:
	return score
	
func get_maximizer() -> bool:
	return is_maximizer
