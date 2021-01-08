extends Node

var fsm: EnemyStateMachine

var attack_buff = load("res://Scripts/Characters/MekaMongke/Boost/AttackBoostMongke.gd")

func next(next_state):
	fsm.change_to(next_state)

func exit():
	fsm.back()


func enter() -> void:
	print("Current state : %s" % self.name)
	add_attack_buff()
	yield(get_tree().create_timer(0.5), "timeout")
	next("EndTurn")

func add_attack_buff() -> void:
	fsm.character.battle_buff.damage_buff = attack_buff.new()


func process(_delta):
	pass

func physics_process(_delta):
	pass

func input(_event):
	pass
