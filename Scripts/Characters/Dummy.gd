extends Area2D

class_name Enemy

var stats : Stats = Stats.new(10,0,0,0) 
var battle_stats : Stats = stats

onready var target = $Target setget , get_target

func _ready():
	$CharacterUI.set_health_bar_max_value(stats.health)

func get_target() -> Position2D:
	return target

func get_stats() -> Stats:
	return battle_stats

func hurt(damage : int) -> void:
	battle_stats.health -= damage
	$CharacterUI.set_health_bar(battle_stats.health)
	
	$Sprite.play("hurt")
	yield($Sprite, "animation_finished")
	$Sprite.play("idle")
