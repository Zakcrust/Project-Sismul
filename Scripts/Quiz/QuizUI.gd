extends Control

var quiz : Quiz = Quiz.new(MultipleChoiceQuestion.new(Question.new("Pertanyaan", "Jawaban Benar"),
 MultipleChoice.new(["Jawaban Benar", 
					"Jawaban Salah", 
					"Jawaban Salah", 
					"Jawaban Salah"])),
					Reward.new(),
					6.0)
var answer : String
var question_time : float
var time_reduction : float

var time_count : float = 0

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
	time_reduction = $QuizContainer/TimebarContainer/TimeBar.max_value / question_time
	print(time_reduction)
	#load answer
	$QuizContainer/AnswerContainer/A.text = quiz.multiple_choice_question.choices.choices[0]
	$QuizContainer/AnswerContainer/B.text = quiz.multiple_choice_question.choices.choices[1]
	$QuizContainer/AnswerContainer2/C.text = quiz.multiple_choice_question.choices.choices[2]
	$QuizContainer/AnswerContainer2/D.text = quiz.multiple_choice_question.choices.choices[3]


func check_answer(ans : String) -> void:
	if ans == answer:
		print("Correct")
		emit_signal("correct")
		set_process(false)
	else:
		print("Wrong")
		emit_signal("wrong")
		set_process(false)
	

func _on_A_pressed(): 
	check_answer($QuizContainer/AnswerContainer/A.text)


func _on_B_pressed():
	check_answer($QuizContainer/AnswerContainer/B.text)


func _on_C_pressed():
	check_answer($QuizContainer/AnswerContainer/C.text)


func _on_D_pressed():
	check_answer($QuizContainer/AnswerContainer/D.text)

func _process(delta):
	$QuizContainer/TimebarContainer/TimeBar.value -= (time_reduction * delta)
	if $QuizContainer/TimebarContainer/TimeBar.value <= 0:
		set_process(false)
