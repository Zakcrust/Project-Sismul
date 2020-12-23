extends Node

class_name Question

var question : String setget , get_question
var answer : String setget , get_answer

func _init(question_init : String, answer_init : String):
	question = question_init
	answer = answer_init


func get_question() -> String:
	return question

func get_answer() -> String:
	return answer
