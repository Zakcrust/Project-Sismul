extends Node

var questions = [
	MultipleChoiceQuestion.new(Question.new("Pertanyaan 1", "Jawaban Benar"), 
	MultipleChoice.new(["Jawaban Benar",
						"Jawaban Salah", 
						"Jawaban Salah", 
						"Jawaban Salah"])),
						
	MultipleChoiceQuestion.new(Question.new("Pertanyaan 2", "Jawaban Benar"), 
	MultipleChoice.new(["Jawaban Benar",
						"Jawaban Salah", 
						"Jawaban Salah", 
						"Jawaban Salah"])),
						
	MultipleChoiceQuestion.new(Question.new("Pertanyaan 3", "Jawaban Benar"), 
	MultipleChoice.new(["Jawaban Benar",
						"Jawaban Salah", 
						"Jawaban Salah", 
						"Jawaban Salah"])),
						
	MultipleChoiceQuestion.new(Question.new("Pertanyaan 4", "Jawaban Benar"), 
	MultipleChoice.new(["Jawaban Benar",
						"Jawaban Salah", 
						"Jawaban Salah", 
						"Jawaban Salah"])),
						
	MultipleChoiceQuestion.new(Question.new("Pertanyaan 5", "Jawaban Benar"), 
	MultipleChoice.new(["Jawaban Benar",
						"Jawaban Salah", 
						"Jawaban Salah", 
						"Jawaban Salah"]))
]


func _ready():
	randomize()


func get_random_question() -> MultipleChoiceQuestion:
	questions.shuffle()
	return questions.front()
