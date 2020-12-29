extends Node

class_name DialogQuestion

var question_text : String
var question_answer : Array

func _init(question_init : String, answers : Array):
	question_text = question_init
	question_answer = answers


func get_question_text() -> String:
	return question_text

func question_answer() -> Array:
	return question_answer
