extends Node

var fsm: StateMachine

func next(next_state):
	get_tree()
	fsm.change_to(next_state)

func exit():
	fsm.back()


func enter() -> void:
	print("Current state : %s" % self.name)
	defend()
	$Shield.position = fsm.character.global_position + Vector2(18, -18)

func defend() -> void:
	fsm.sprite.play("cast_skill_in")
	yield(fsm.sprite,"animation_finished")
	$DefendAnim.play("cast")
	yield($DefendAnim,"animation_finished")
	yield(get_tree().create_timer(0.5), "timeout")
	fsm.sprite.play("cast_skill_out")
	yield(fsm.sprite, "animation_finished")
	next("EndTurn")

func process(_delta):
	pass

func physics_process(_delta):
	pass

func input(_event):
	pass
