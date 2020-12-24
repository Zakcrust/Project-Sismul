extends Node

var quiz_scene : PackedScene = load("res://Scenes/Quiz/QuizUI.tscn")


func load_quiz(quiz : Quiz, player_ref : Character) -> void:
	var current_scene = get_tree().current_scene
	var quiz_instance = quiz_scene.instance()
	quiz_instance.quiz = quiz
	quiz_instance.character = player_ref
#	quiz_instance.rect_position = Vector2(585,270)
	current_scene.add_child(quiz_instance)
