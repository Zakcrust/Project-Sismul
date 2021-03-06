extends Node

var fsm: StateMachine

func next(next_state):
	get_tree()
	fsm.change_to(next_state)

func exit():
	fsm.back()


func enter() -> void:
	print("Current state : %s" % self.name)
	fsm.sprite.play("dead")
	fsm.character.hide_pointer()


func process(_delta):
	pass

func physics_process(_delta):
	pass

func input(_event):
	pass
