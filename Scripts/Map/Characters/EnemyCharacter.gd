extends Node2D

class_name EnemyCharacter

export (Array, PackedScene) var battlers

var battler_instances : Array

var dialog_scene : PackedScene = load("res://Scenes/Dialog/DialogUI.tscn")


func _ready():
	for battler in battlers:
		battler_instances.append(battler.instance())

func fight(player : PackedScene) -> void:
	to_battle(player)


func to_battle(player : PackedScene) -> void:
	BattleData.enemy_character = self
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
