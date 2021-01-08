extends Node

class_name MinimaxState

var ATTACK_SCORE : int = 0
var DEFEND_SCORE : int = 0
var BOOST_SCORE : int = 0


func _init(attack_init : int, defend_init : int, boost_init : int):
	ATTACK_SCORE = attack_init
	DEFEND_SCORE = defend_init
	BOOST_SCORE = boost_init


func get_score(state : int) -> int:
	match(state):
		MinimaxStates.ATTACK:
			return ATTACK_SCORE
		MinimaxStates.DEFEND:
			return DEFEND_SCORE
		MinimaxStates.BOOST:
			return BOOST_SCORE
	return 0
