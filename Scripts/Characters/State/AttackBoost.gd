extends Node

var fsm: EnemyStateMachine

var attack_buff : Buff = Buff.new(ItemEffectTypes.ATTACK_BOOST, 3 , 5)

func next(next_state):
	get_tree()
	fsm.change_to(next_state)

func exit():
	fsm.back()


func enter() -> void:
	print("Current state : %s" % self.name)
	add_attack_buff()
	yield(get_tree().create_timer(2.0), "timeout")
	next("EndTurn")

func add_attack_buff() -> void:
	fsm.character.battle_buff.damage_buff = attack_buff


func process(_delta):
	pass

func physics_process(_delta):
	pass

func input(_event):
	pass
