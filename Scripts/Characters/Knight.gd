extends Area2D

class_name Player

signal end_turn()
signal dead(object)

var enemies : Array
var stats : Stats = Stats.new(10,10,3,2,3)
var battle_stats : Stats = stats

onready var target : Position2D = $Target setget , get_target

func get_target() -> Position2D:
	return target

func _ready():
	$AttackCast.collide_with_areas = true
	$Sprite.play("idle")
	$CharacterUI.set_health_bar_max_value(stats.health)

func get_stats() -> Stats:
	return battle_stats

func victory() -> void:
	$Sprite.play("cast_skill_in")
	yield($Sprite, "animation_finished")
	$Sprite.play("cast_skill_out")
	yield($Sprite, "animation_finished")
	$Sprite.play("idle")

func play_turn():
	$State.initialize()

func hurt(damage : int) -> void:
	battle_stats.health -= (damage - battle_stats.armor)
	$CharacterUI.set_health_bar(battle_stats.health)
	$Sprite.play("hurt")
	yield($Sprite, "animation_finished")
	$Sprite.play("idle")
	check_health()

func get_current_state() -> String:
	return $State.state.name

func check_health() -> void:
	if battle_stats.health <= 0:
		battle_stats.health = 0
		$CharacterUI.hide()
		$State.change_to("Dead")
