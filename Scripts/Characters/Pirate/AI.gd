extends Node


export (NodePath) var fsm_path

onready var fsm : EnemyStateMachine = get_node(fsm_path)

func play_turn() -> void:
	fsm.change_to("Attack")
