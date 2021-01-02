extends Control

var answer : String
var question_time : float
var time_reduction : float
var reward

var quiz : Quiz
var character : Character

signal correct(reward)
signal wrong()


func _ready():
	$Camera2D.current = true
	set_process(false)
	yield($AnimationPlayer, "animation_finished")
	load_question()
	set_process(true)


func load_question() -> void:
	connect("correct", character, "redeem_reward")
	connect("wrong", character, "remove_object")
	#load question and answer
	$QuizContainer/ColorRect/CenterContainer/Question.text = quiz.multiple_choice_question.question.question
	answer = quiz.multiple_choice_question.question.answer
	question_time = quiz.time
	reward = quiz.reward
	time_reduction = $QuizContainer/TimebarContainer/TimeBar.max_value / question_time
	print(time_reduction)
	var choices : Array = quiz.multiple_choice_question.choices.choices
	choices.shuffle()
	#load answer
	$QuizContainer/ColorRect/HBoxContainer/AnswerContainer/A/Text.text = choices[0]
	$QuizContainer/ColorRect/HBoxContainer/AnswerContainer/B/Text.text = choices[1]
	$QuizContainer/ColorRect/HBoxContainer/AnswerContainer2/C/Text.text = choices[2]
	$QuizContainer/ColorRect/HBoxContainer/AnswerContainer2/D/Text.text = choices[3]
	$QuizContainer/ColorRect/HBoxContainer.show()
	$QuizContainer/ColorRect/CenterContainer.show()
	print("question loaded")

func check_answer(ans : String) -> void:
	disable_buttons()
	set_process(false)
	if ans == answer:
		SoundAndMusic.play_sfx(SoundAndMusic.CORRECT_SFX)
		print("Correct")
		emit_signal("correct", reward)
	else:
		SoundAndMusic.play_sfx(SoundAndMusic.WRONG_SFX)
		print("Wrong")
		emit_signal("wrong")
	character.activate()
	character.enable_camera()
	queue_free()
	

func _on_A_pressed(): 
	check_answer($QuizContainer/ColorRect/HBoxContainer/AnswerContainer/A/Text.text)


func _on_B_pressed():
	check_answer($QuizContainer/ColorRect/HBoxContainer/AnswerContainer/B/Text.text)


func _on_C_pressed():
	check_answer($QuizContainer/ColorRect/HBoxContainer/AnswerContainer2/C/Text.text)


func _on_D_pressed():
	check_answer($QuizContainer/ColorRect/HBoxContainer/AnswerContainer2/D/Text.text)


func disable_buttons() -> void:
	$QuizContainer/ColorRect/HBoxContainer/AnswerContainer/A.disabled = true
	$QuizContainer/ColorRect/HBoxContainer/AnswerContainer/B.disabled = true
	$QuizContainer/ColorRect/HBoxContainer/AnswerContainer2/C.disabled = true
	$QuizContainer/ColorRect/HBoxContainer/AnswerContainer2/D.disabled = true


func _process(delta):
	$QuizContainer/TimebarContainer/TimeBar.value -= (time_reduction * delta)
	if $QuizContainer/TimebarContainer/TimeBar.value <= 0:
		set_process(false)
