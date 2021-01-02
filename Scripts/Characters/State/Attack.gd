extends Node

var fsm: EnemyStateMachine
var players : Array

onready var attack_cast : RayCast2D = get_parent().get_parent().get_node("AttackCast")

var player : Player

func next(next_state):
	get_tree()
	fsm.change_to(next_state)

func exit():
	fsm.back()

func enter() -> void:
	print("Current state : %s" % self.name)
	yield(get_tree().create_timer(0.1), "timeout")
	attack()


func attack() -> void:
	players = fsm.character.get_parent().get_players()
	if players.size() == 1:
		player = players[0]
		move_and_attack(player.target.global_position)

func move_and_attack(pos : Vector2) -> void:
	attack_cast.enabled = true
	var first_pos = fsm.character.global_position
	fsm.character.z_index += 1
	$Tween.stop(self)
	fsm.sprite.play("move")
	$Tween.interpolate_property(fsm.character, "position",fsm.character.global_position, pos, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")
	fsm.sprite.play("attack")
	yield(fsm.sprite, "animation_finished")
	cast_attack()
	fsm.sprite.play("idle")
	yield(get_tree().create_timer(0.5), "timeout")
	fsm.sprite.play("move")
	$Tween.interpolate_property(fsm.character, "position",fsm.character.global_position, first_pos, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")
	fsm.sprite.play("idle")
	fsm.character.z_index -= 1
	attack_cast.enabled = false
	next("EndTurn")

func cast_attack() -> void:
	var attacked_enemy  = attack_cast.get_collider()
	if attacked_enemy is Player:
		attacked_enemy.hurt(fsm.character.battle_stats.damage)

func process(_delta):
	pass

func physics_process(_delta):
	pass

func input(_event):
	pass
