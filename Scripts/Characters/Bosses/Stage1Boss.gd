extends Node2D

class_name Stage1Boss

export (PackedScene) var reward

var dialog_data : GDScript = load("res://Scripts/Dialog/Resource/BossStage1/Stage1Dialogues.gd")
var failed_dialog : GDScript = load("res://Scripts/Dialog/Resource/failed_dialog.gd")
var dialog_scene : PackedScene = load("res://Scenes/Dialog/DialogUI.tscn")
var player_ref : Character
var interacting : bool = false

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
	if interacting:
		return
	var dialog
	if get_parent().is_enemy_avaiable():
		dialog = failed_dialog.new()
	else:
		dialog = dialog_data.new()
	var dialog_instance = dialog_scene.instance()
	add_child(dialog_instance)
	dialog_instance.connect("dialog_success", self, "dialog_success")
	dialog_instance.connect("dialog_failed", self, "dialog_failed")
	dialog_instance.load_dialog(dialog.get_dialogues())
	interacting = true
	
	

func dialog_success() -> void:
	var reward_instance = reward.instance()
	player_ref.redeem_reward(reward_instance)
	player_ref.activate()
	get_parent().show_ui()
	interacting = false
	queue_free()
	

func dialog_failed() -> void:
	player_ref.activate()
	get_parent().show_ui()
	interacting = false
