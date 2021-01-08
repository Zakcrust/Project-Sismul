extends Node

onready var fsm : EnemyStateMachine = get_parent().get_node("State")

var player

var minimax_result : MinimaxNode

func play_turn() -> void:
	play_minimax_turn()
#	if(fsm.character.battle_buff.damage_buff != null):
#		fsm.change_to("Attack")
#	else:
#		fsm.change_to("AttackBoost")
	

func play_minimax_turn() -> void:
	minimax_result = Minimax.minimax(Minimax.player_root_node, 3, 6)
	match(minimax_result.state):
		MinimaxStates.ATTACK:
			fsm.change_to("Attack")
		MinimaxStates.DEFEND:
			fsm.change_to("Defend")
		MinimaxStates.BOOST:
			fsm.change_to("AttackBoost")
		_:
			fsm.change_to("EndTurn")
