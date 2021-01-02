extends Node

class_name DialogQuestion

var answer : String setget , get_answer
var question_answer : Array setget , get_question_answer

func _init(answer_init : String ,answers : Array):
	answer = answer_init
	question_answer = answers


func get_answer() -> String:
	return answer

func get_question_answer() -> Array:
	return question_answer
