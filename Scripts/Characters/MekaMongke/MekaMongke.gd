extends Area2D

signal end_turn

var stats : Stats = Stats.new(10,10,6,0,2) 
var battle_stats : Stats = stats

onready var target = $Target setget , get_target

func _ready():
	$Sprite/CharacterUI.set_health_bar_max_value(stats.health)
	$Anim.play("idle")

func get_target() -> Position2D:
	return target

func get_stats() -> Stats:
	return battle_stats

func play_turn():
	$State.initialize()
	yield(get_tree().create_timer(1.0), "timeout")
	$AI.play_turn()

func hurt(damage : int) -> void:
	battle_stats.health -= (damage - battle_stats.armor)
	$Sprite/CharacterUI.set_health_bar(battle_stats.health)
	if check_dead():
		battle_stats.health = 0
		$Anim.stop()
		$Anim.play("dead")
		$Sprite/CharacterUI.hide()
		$State.change_to("Dead")
		return
	$Anim.play("hurt")
	yield($Anim, "animation_finished")
	$Anim.play("idle")

func check_dead() -> bool:
	return battle_stats.health <= 0

func get_current_state() -> String:
	return $State.state.name

func victory() -> void:
	$Anim.stop()
	$Anim.play("idle")


func _on_Anim_animation_finished(anim_name):
	pass
