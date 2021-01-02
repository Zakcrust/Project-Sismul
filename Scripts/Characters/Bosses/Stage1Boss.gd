extends Node2D

class_name Stage1Boss

export (PackedScene) var reward

var dialog_data : GDScript = load("res://Scripts/Dialog/Resource/BossStage1/Stage1Dialogues.gd")
var dialog_scene : PackedScene = load("res://Scenes/Dialog/DialogUI.tscn")
var player_ref : Character

func _on_Detector_body_entered(body):
	if body is Character:
		player_ref = body
		$ExlamationMark.show()
		body.object_to_interact = self


func _on_Detector_body_exited(body):
	if body is Character:
		player_ref = null
		$ExlamationMark.hide()
		body.object_to_interact = null


func start_dialog() -> void:
	var dialog_instance = dialog_scene.instance()
	var dialog = dialog_data.new()
	add_child(dialog_instance)
	dialog_instance.connect("dialog_success", self, "dialog_success")
	dialog_instance.connect("dialog_failed", self, "dialog_failed")
	dialog_instance.load_dialog(dialog.get_dialogues())
	
	

func dialog_success() -> void:
	var reward_instance = reward.instance()
	player_ref.redeem_reward(reward_instance)
	player_ref.activate()
	queue_free()

func dialog_failed() -> void:
	player_ref.activate()
