extends Node

class_name DialogAnswer

var dialog_answer : String
var answer_script_path : String

func _init(answer_init : String, answer_script : String):
	dialog_answer = answer_init
	answer_script_path = answer_script

func get_dialog_answer() -> String:
	return dialog_answer

func get_answer_script_path() -> String:
	return answer_script_path
