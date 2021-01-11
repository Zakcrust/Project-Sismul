extends Node

var fsm: StateMachine

func next(next_state):
	get_tree()
	fsm.change_to(next_state)

func exit():
	fsm.back()


func enter() -> void:
	print("Current state : %s" % self.name)
	fsm.character.end_turn()
	Minimax.player_root_node = fsm.character.minimax_node
	fsm.sprite.play("idle")
	fsm.character.hide_pointer()

func process(_delta):
	pass

func physics_process(_delta):
	pass

func input(_event):
	pass
