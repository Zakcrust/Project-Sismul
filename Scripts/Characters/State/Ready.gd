extends Node

var fsm: EnemyStateMachine

func next(next_state):
	fsm.change_to(next_state)

func exit():
	fsm.back()

func enter() -> void:
	print("Current state : %s" % self.name)
	fsm.character.show_pointer()
	fsm.sprite.play("idle")


func process(_delta):
	pass

func physics_process(_delta):
	pass

func input(_event):
	pass
