extends Node

var fsm: StateMachine

var defend_buff = load("res://Scripts/Characters/Knight/Boosts/DefenseBoost.gd")

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
	add_defend_buff()
	yield(get_tree().create_timer(0.5), "timeout")
	fsm.sprite.play("cast_skill_out")
	yield(fsm.sprite, "animation_finished")
	fsm.character.minimax_node.state = MinimaxStates.DEFEND
	fsm.character.minimax_node.score = defend_buff.new().amount
	next("EndTurn")

func add_defend_buff() -> void:
	fsm.character.battle_buff.armour_buff = defend_buff.new()

func process(_delta):
	pass

func physics_process(_delta):
	pass

func input(_event):
	pass
