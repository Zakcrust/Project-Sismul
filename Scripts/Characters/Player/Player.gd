extends KinematicBody2D

class_name Character

var object_to_interact setget set_object, get_object

func set_object(value) -> void:
	object_to_interact = value
	
func get_object():
	return object_to_interact

func activate() -> void:
	$StateMachine.change_to("Move")
