extends StaticBody2D

var quiz : Quiz = Quiz.new(QuestionPool.get_random_question(),3.0)

export (PackedScene) var reward

var character : Character

func _ready():
	quiz.reward = reward.instance()

var collosion

#func _process(delta):
#	collosion = $ObjectCast.get_collider()
#	if(collosion != null):
#		if(collosion is Character):
#			character = collosion
#			character.object_to_interact = self
#			$Exclamation.show()
#	else:
#		$Exclamation.hide()
#		if(character != null):
#			character.object_to_interact = null


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
