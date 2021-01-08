extends KinematicBody2D

class_name Character

var player_battler : PackedScene = load("res://Scenes/Battlers/Knight.tscn")
var reward_ui : PackedScene = load("res://Scenes/UI/RewardUI.tscn")

var boundary : Vector2 = Vector2(3200, 3160)

signal flicker_done()

func _ready():
	$Camera2D.current = true

var object_to_interact setget set_object, get_object

func set_object(value) -> void:
	object_to_interact = value
	
func get_object():
	return object_to_interact

func remove_object() -> void:
	if object_to_interact != null:
		object_to_interact.queue_free()

func redeem_reward(reward) -> void:
	remove_object()
	print("Redeem rewards ...")
	PlayerData.add_reward(reward)
	var reward_ui_instance = reward_ui.instance()
	if reward is ItemReward:
		reward_ui_instance.load_item(load(reward.item.item_asset_path), reward.item.item_name + "  x%s" % reward.reward.amount)
	elif reward is StatReward:
		reward_ui_instance.load_item(load(reward.sprite_path), reward.stat_type + "  +%s" % reward.reward.amount)
	add_child(reward_ui_instance)
	yield(reward_ui_instance,"tree_exited")
	get_parent().show_ui()
	SoundAndMusic.play_music(SoundAndMusic.PEKORA_BGM)
	
func flicker_transition() -> void:
	var parent = get_parent()
	parent.transition_flicker()
	yield(parent, "flicker_done")
	emit_signal("flicker_done")


func enable_camera() -> void:
	$Camera2D.current = true

func disable_camera() -> void:
	$Camera2D.current = false

func activate() -> void:
	$StateMachine.change_to("Move")
	
