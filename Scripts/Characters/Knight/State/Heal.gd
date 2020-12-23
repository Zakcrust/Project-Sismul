extends Node

var fsm: StateMachine

func next(next_state):
	get_tree()
	fsm.change_to(next_state)

func exit():
	fsm.back()


func enter() -> void:
	print("Current state : %s" % self.name)
	$Potion.position = fsm.character.global_position + Vector2(20, -6)
	$HealParticles.position = fsm.character.global_position + Vector2(14, 78)
	heal()

func heal() -> void:
	fsm.sprite.play("cast_skill_in")
	yield(fsm.sprite,"animation_finished")
	$HealAnim.play("use_potion")
	yield($HealAnim,"animation_finished")
	yield(get_tree().create_timer(0.5), "timeout")
	fsm.sprite.play("cast_skill_out")
	yield(fsm.sprite, "animation_finished")
	$HealParticles.emitting = true
	yield(get_tree().create_timer(1.5), "timeout")
	next("EndTurn")
	


func process(_delta):
	pass

func physics_process(_delta):
	pass

func input(_event):
	pass
