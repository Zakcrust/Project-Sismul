extends StaticBody2D

var quiz : Quiz = Quiz.new(QuestionPool.get_random_question(),3.0)

export (PackedScene) var reward

func _ready():
	quiz.reward = reward.instance()

var collosion

func _process(delta):
	collosion = $ObjectCast.get_collider()
	if(collosion != null):
		$Exclamation.show()
	else:
		$Exclamation.hide()
