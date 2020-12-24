extends Control

var answer : String
var question_time : float
var time_reduction : float
var reward

var quiz : Quiz
var character : Character

signal correct()
signal wrong()


func _ready():
	set_process(false)
	yield($QuizInitial/AnimationPlayer, "animation_finished")
	load_question()
	set_process(true)


func load_question() -> void:
	
	#load question and answer
	$QuizContainer/ColorRect/CenterContainer/Question.text = quiz.multiple_choice_question.question.question
	answer = quiz.multiple_choice_question.question.answer
	question_time = quiz.time
	reward = quiz.reward
	time_reduction = $QuizContainer/TimebarContainer/TimeBar.max_value / question_time
	print(time_reduction)
	#load answer
	$QuizContainer/AnswerContainer/A.text = quiz.multiple_choice_question.choices.choices[0]
	$QuizContainer/AnswerContainer/B.text = quiz.multiple_choice_question.choices.choices[1]
	$QuizContainer/AnswerContainer2/C.text = quiz.multiple_choice_question.choices.choices[2]
	$QuizContainer/AnswerContainer2/D.text = quiz.multiple_choice_question.choices.choices[3]

	print("question loaded")

func check_answer(ans : String) -> void:
	disable_buttons()
	if ans == answer:
		print("Correct")
		set_process(false)
	else:
		print("Wrong")
		set_process(false)
	yield(get_tree().create_timer(2.0), "timeout")
	character.activate()
	queue_free()
	

func _on_A_pressed(): 
	check_answer($QuizContainer/AnswerContainer/A.text)


func _on_B_pressed():
	check_answer($QuizContainer/AnswerContainer/B.text)


func _on_C_pressed():
	check_answer($QuizContainer/AnswerContainer2/C.text)


func _on_D_pressed():
	check_answer($QuizContainer/AnswerContainer2/D.text)


func disable_buttons() -> void:
	$QuizContainer/AnswerContainer/A.disabled = true
	$QuizContainer/AnswerContainer/B.disabled = true
	$QuizContainer/AnswerContainer2/C.disabled = true
	$QuizContainer/AnswerContainer2/D.disabled = true


func _process(delta):
	$QuizContainer/TimebarContainer/TimeBar.value -= (time_reduction * delta)
	if $QuizContainer/TimebarContainer/TimeBar.value <= 0:
		set_process(false)
