extends Node

class_name DialogAnswer

var dialog_answer : String setget , get_dialog_answer
var next_dialog : Array setget , get_next_dialog

func _init(answer_init : String, dialog : Array):
	dialog_answer = answer_init
	next_dialog = dialog

func get_dialog_answer() -> String:
	return dialog_answer

func get_next_dialog() -> Array:
	return next_dialog
