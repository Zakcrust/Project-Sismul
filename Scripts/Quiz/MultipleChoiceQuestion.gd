extends Node

class_name MultipleChoiceQuestion

var question : Question
var choices : MultipleChoice

func _init(question_init : Question, choices_init : MultipleChoice):
	question = question_init
	choices = choices_init

func get_question() -> Question:
	return question

func get_choices() -> MultipleChoice:
	return choices
