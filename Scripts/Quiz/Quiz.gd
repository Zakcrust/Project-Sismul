extends Node

class_name Quiz

var multiple_choice_question : MultipleChoiceQuestion setget , get_question
var reward setget , get_reward
var time : float setget , get_time


func _init(mult_choice_question_init : MultipleChoiceQuestion, time_init : float , reward_init = null):
	multiple_choice_question = mult_choice_question_init
	reward = reward_init
	time = time_init

func get_question() -> MultipleChoiceQuestion:
	return multiple_choice_question

func get_reward() -> Reward:
	return reward

func get_time() -> float:
	return time
