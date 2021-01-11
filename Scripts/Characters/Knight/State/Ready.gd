extends Node

var fsm: StateMachine

func next(next_state):
	fsm.change_to(next_state)

func exit():
	fsm.back()


func enter() -> void:
	print("Current state : %s" % self.name)
	fsm.emit_signal("activate_action_menu")
	print("Signal emitted")
	fsm.sprite.play("idle")
	fsm.character.show_pointer()
	


func process(_delta):
	pass

func physics_process(_delta):
	pass

func input(_event):
	pass
