extends StaticBody2D

var quiz : Quiz = Quiz.new(ArithmethicGenerator.new().generate_aritmethic(),20.0)

export (GDScript) var reward
export (int) var reward_amount = 1
var character : Character

func _ready():
	quiz.reward = reward.new()
	if quiz.reward is StatReward:
		quiz.reward.reward.amount = reward_amount
	elif quiz.reward is ItemReward:
		quiz.reward.reward.amount = reward_amount


func interact(player_ref : Character) -> void:
	QuizLoader.load_quiz(quiz, player_ref)


func _on_DetectPlayer_body_entered(body):
	if body is Character:
		character = body
		character.object_to_interact = self
		$Exclamation.show()


func _on_DetectPlayer_body_exited(body):
	if body is Character:
		character.object_to_interact = null
		character = null
		$Exclamation.hide()
