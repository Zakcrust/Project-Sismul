extends Node

var question_1_true_answer : Array = [
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster1.png",
	"Correct, lets move on to the next question",
	DialogType.STATEMENT),
]

var question_1_false_answer : Array = [
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster1.png",
	"Wrong answer, it seems you are not worthy enough. comeback next time.",
	DialogType.STATEMENT_END),
]

var question_2_true_answer : Array = [
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster1.png",
	"Correct, lets move on to the next question",
	DialogType.STATEMENT),
]

var question_2_false_answer : Array = [
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster1.png",
	"Wrong answer, it seems you are not worthy enough. comeback next time.",
	DialogType.STATEMENT_END),
]

var question_3_true_answer : Array = [
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster1.png",
	"Good job. You have answered those questions correcly. now you may continue your journey traveller.",
	DialogType.STATEMENT),
]

var question_3_false_answer : Array = [
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster1.png",
	"Wrong answer, it seems you are not worthy enough. comeback next time.",
	DialogType.STATEMENT),
]

var statements_init = [
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster1.png",
	"Welcome to traveler. to pass this gate you have to answer these questions correctly",
	DialogType.STATEMENT),
	
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster1.png",
	"Uang Beni 3 1/4 kali lebih banyak daripada uang milik Roy. Apabila uang Roy Rp4.800,00. Berapakah uang Beni?",
	DialogType.QUESTION,
	DialogQuestion.new(
		"Rp15.600,00",
		[
		DialogAnswer.new("Rp15.600,00", question_1_true_answer),
		DialogAnswer.new("Rp13.600,00", question_1_false_answer),
		DialogAnswer.new("Rp14.800,00", question_1_false_answer),
		DialogAnswer.new("Rp16.200,00", question_1_false_answer)
	])),
	
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster1.png",
	"Sebuah truk dalam setiap kali mengangkut pasir satu rit volumenya 6 2/3 m3. Hari itu truk mengangkut 4 3/4 rit pasir. Berapa m3 pasir yang diangkut truk tersebut?",
	DialogType.QUESTION,
	DialogQuestion.new(
		"30 2/5 m3",
		[
		DialogAnswer.new("30 2/5 m3", question_2_true_answer),
		DialogAnswer.new("28 1/5 m3", question_2_false_answer),
		DialogAnswer.new("29 6/10 m3", question_2_false_answer),
		DialogAnswer.new("27 3/5 m3", question_2_false_answer)
	])),
	
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster1.png",
	"Ali berlari mengelilingi lapangan 4 1/2 putaran. Jika setiap satu putaran menempuh jarak  96 1/2 meter. Berapa meter jarak yang ditempuh Ali?",
	DialogType.QUESTION,
	DialogQuestion.new(
		"434 1/4 meter",
		[
		DialogAnswer.new("434 1/4 meter", question_3_true_answer),
		DialogAnswer.new("436 2/4 meter", question_3_false_answer),
		DialogAnswer.new("344 3/4 meter", question_3_false_answer),
		DialogAnswer.new("440 meter", question_3_false_answer)
	])),
]


func get_dialogues() -> Array:
	return statements_init
