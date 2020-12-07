extends Area2D

signal anim_finished()

var enemies : Array


var stats : Stats = Stats.new(10,10,3,2)

var battle_stats : Stats = stats

func _ready():
	$AttackCast.collide_with_areas = true

func get_stats() -> Stats:
	return battle_stats

func _on_Sprite_animation_finished():
	emit_signal("anim_finished")


func move_and_attack(pos) -> void:
	$AttackCast.enabled = true
	var first_pos = position
	z_index += 1
	$Tween.stop(self)
	$Sprite.play("move")
	$Tween.interpolate_property(self, "position",position, pos, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")
	$Sprite.play("attack")
	yield(self,"anim_finished")
	attack()
	$Sprite.play("idle")
	yield(get_tree().create_timer(0.5), "timeout")
	$Sprite.play("move")
	$Tween.interpolate_property(self, "position",position, first_pos, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")
	$Sprite.play("idle")
	z_index -= 1
	$AttackCast.enabled = false
	

func attack() -> void:
	var attacked_enemy  = $AttackCast.get_collider()
	if attacked_enemy is Enemy:
		attacked_enemy.hurt(battle_stats.damage)
	


func face_direction(pos) -> void:
	if pos.x < position.x :
		$Sprite.scale.x = -1
	else:
		$Sprite.scale.x = 1


func _on_BattleMenu_attack():
	enemies = get_parent().get_enemies()
	if enemies.size() == 1:
		var enemy : Enemy = enemies[0]
		move_and_attack(enemy.target.global_position)
