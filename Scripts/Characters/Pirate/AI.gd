extends Node

onready var fsm : EnemyStateMachine = get_parent().get_node("State")

var player

var player_possible_state

func play_turn() -> void:
	fsm.change_to("Attack")
#	if(fsm.character.battle_buff.damage_buff != null):
#		fsm.change_to("Attack")
#	else:
#		fsm.change_to("AttackBoost")


func minimax(depth) -> void:
	pass

class MinimaxNode:
	var value : float = 0
	var child : Array
	var type : String


class MinimaxTypes:
	const BOOST = "BOOST"
	const CONSTANT = "CONSTANT"

func get_all_possible_state() -> void:
	pass
