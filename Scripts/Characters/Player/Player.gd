extends KinematicBody2D

class_name Character

var player_battler : PackedScene = load("res://Scenes/Battlers/Knight.tscn")

var boundary : Vector2 = Vector2(2340, 952)


func _ready():
	$Camera2D.current = true

var object_to_interact setget set_object, get_object

func set_object(value) -> void:
	object_to_interact = value
	
func get_object():
	return object_to_interact

func disable_camera() -> void:
	$Camera2D.current = false

func activate() -> void:
	$StateMachine.change_to("Move")
