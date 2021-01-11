extends Node2D

class_name EnemyCharacter

export (Array, PackedScene) var battlers
export (GDScript) var reward
export (int) var reward_amount = 1
export (float) var stats_multiplier = 1

var battler_instances : Array
var dialog_scene : PackedScene = load("res://Scenes/Dialog/DialogUI.tscn")


func _ready():
	for battler in battlers:
		var instance = battler.instance()
		instance.multiply_stats(stats_multiplier)
		battler_instances.append(instance)

func fight(player : PackedScene) -> void:
	battler_instances.clear()
	for battler in battlers:
		var instance = battler.instance()
		battler_instances.append(instance)
	print(battler_instances)
	to_battle(player)


func to_battle(player : PackedScene) -> void:
	BattleData.enemy_character = self
	BattleData.battle_reward = reward.new()
	if BattleData.battle_reward is StatReward:
		BattleData.battle_reward.reward.amount = reward_amount
	elif BattleData.battle_reward is ItemReward:
		BattleData.battle_reward.reward.amount = reward_amount
	battler_instances.append(player.instance())
	SceneLoader.load_battle_scene(battler_instances)


func _on_Detector_body_entered(body):
	if body is Character:
		$ExlamationMark.show()
		body.object_to_interact = self


func _on_Detector_body_exited(body):
	if body is Character:
		$ExlamationMark.hide()
		body.object_to_interact = null
