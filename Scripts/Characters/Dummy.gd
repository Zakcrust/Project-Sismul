extends Area2D

class_name Enemy

signal end_turn

var stats : Stats = Stats.new(10,10,4,0,2) 
var battle_stats : Stats = stats

onready var target = $Target setget , get_target

func _ready():
	$CharacterUI.set_health_bar_max_value(stats.health)

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
	$CharacterUI.set_health_bar(battle_stats.health)
	$Sprite.play("hurt")
	yield($Sprite, "animation_finished")
	$Sprite.play("idle")
