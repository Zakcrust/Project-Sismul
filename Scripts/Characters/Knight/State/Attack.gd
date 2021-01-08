extends Node

var fsm: StateMachine

export (NodePath) var attack_cast_path

onready var attack_cast = get_node(attack_cast_path)

var enemies : Array

func next(next_state):
	fsm.change_to(next_state)

func exit():
	fsm.back()

func enter() -> void:
	fsm.emit_signal("disactivate_action_menu")
	print("Current state : %s" % self.name)
	yield(get_tree().create_timer(0.1), "timeout")
	attack()

func attack() -> void:
	enemies = fsm.character.get_parent().get_enemies()
	print(enemies)
	if enemies.size() >= 1:
		var enemy = enemies[0]
		move_and_attack(enemy.target.global_position)

func move_and_attack(pos : Vector2) -> void:
	attack_cast.enabled = true
	var first_pos = fsm.character.global_position
	fsm.character.z_index += 1
	$Tween.stop(self)
	fsm.sprite.play("move")
	$Tween.interpolate_property(fsm.character, "position",fsm.character.global_position, pos, 1.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")
	fsm.sprite.play("attack")
	yield(fsm.sprite, "animation_finished")
	cast_attack()
	fsm.sprite.play("idle")
	yield(get_tree().create_timer(0.5), "timeout")
	fsm.sprite.play("move")
	$Tween.interpolate_property(fsm.character, "position",fsm.character.global_position, first_pos, 1.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")
	fsm.sprite.play("idle")
	fsm.character.z_index -= 1
	attack_cast.enabled = false
	fsm.character.minimax_node.state = MinimaxStates.ATTACK
	fsm.character.minimax_node.score = fsm.character.battle_stats.damage
	next("EndTurn")

func cast_attack() -> void:
	var attacked_enemy  = attack_cast.get_collider()
	print("collided object %s " % attacked_enemy)
	if attacked_enemy.is_in_group("Enemy"):
		attacked_enemy.hurt(fsm.character.battle_stats.damage)


func process(_delta):
	pass

func physics_process(_delta):
	pass

func input(_event):
	pass
