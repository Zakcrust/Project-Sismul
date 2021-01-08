extends Node

var fsm: EnemyStateMachine

var defend_buff = load("res://Scripts/Characters/MekaMongke/Boost/DefenseBoostMongke.gd")

func next(next_state):
	get_tree()
	fsm.change_to(next_state)

func exit():
	fsm.back()


func enter() -> void:
	print("Current state : %s" % self.name)
	defend()
	yield(get_tree().create_timer(0.5), "timeout")
	next("EndTurn")

func defend() -> void:
	fsm.character.battle_buff.armour_buff = defend_buff.new()

func process(_delta):
	pass

func physics_process(_delta):
	pass

func input(_event):
	pass
