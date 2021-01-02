extends Node

onready var fsm : EnemyStateMachine = get_parent().get_node("State")

func play_turn() -> void:
	fsm.change_to("Attack")
