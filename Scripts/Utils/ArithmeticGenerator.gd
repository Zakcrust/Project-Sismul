extends Node

class_name ArithmethicGenerator

var types : Array = [
	ArithmethicTypes.ADDITION,
	ArithmethicTypes.SUBSTRACTION,
	ArithmethicTypes.MULTIPLICATION
]

func _ready():
	randomize()

func generate_aritmethic() -> MultipleChoiceQuestion:
	types.shuffle()
	var result : int
	var answers : Array
	var question : String
	var a : int
	var b : int
	var choosen_type = types.front()
	match(choosen_type):
		ArithmethicTypes.ADDITION:
			a = randi() % 200 + 1
			b = randi() % 200 + 1
			result = a + b
			question = "%s + %s = ..." % [a,b]
		ArithmethicTypes.SUBSTRACTION:
			a = randi() % 250 + 1
			b = randi() % 100 + 1
			result = a - b
			question = "%s - %s = ..." % [a,b]
		ArithmethicTypes.MULTIPLICATION:
			a = randi() % 12 + 1
			b = randi() % 12 + 1
			result = a * b
			question = "%s x %s = ..." % [a,b]
	answers.append(str(result))
	var current_loop_answer = ""
	var prev_loop_answer = "-"
	for i in range(0, 3):
		current_loop_answer = str(result + (randi() % 20 - 10))
		while(answers.has(current_loop_answer)):
			current_loop_answer = str(result + (randi() % 20 - 10))
		answers.append(current_loop_answer)
		
	
	return MultipleChoiceQuestion.new(Question.new(question, str(result)), MultipleChoice.new(answers))


class ArithmethicTypes:
	const ADDITION = "ADDITION"
	const SUBSTRACTION = "SUBSTRACTION"
	const MULTIPLICATION = "MULTIPLICATION"
