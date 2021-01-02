extends Node2D

class_name EnemyCharacter

export (Array, PackedScene) var battlers
export (PackedScene) var reward

var battler_instances : Array

var dialog_scene : PackedScene = load("res://Scenes/Dialog/DialogUI.tscn")


func _ready():
	for battler in battlers:
		var instance = battler.instance()
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
	BattleData.battle_reward = reward.instance()
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
