extends Node

var question_1_true_answer : Array = [
	Dialog.new("Totem",
	 "res://Assets/Sprites/chars/CloseUp/Player/player_normal.tres",
	"Correct, lets move on to the next question",
	DialogType.STATEMENT),
]

var question_1_false_answer : Array = [
	Dialog.new("Totem",
	 "res://Assets/Sprites/chars/CloseUp/Player/player_normal.tres",
	"Wrong answer, it seems you are not worthy enough. comeback next time.",
	DialogType.STATEMENT_END),
]

var question_2_true_answer : Array = [
	Dialog.new("Totem",
	 "res://Assets/Sprites/chars/CloseUp/Player/player_normal.tres",
	"Correct, lets move on to the next question",
	DialogType.STATEMENT),
]

var question_2_false_answer : Array = [
	Dialog.new("Totem",
	 "res://Assets/Sprites/chars/CloseUp/Player/player_normal.tres",
	"Wrong answer, it seems you are not worthy enough. comeback next time.",
	DialogType.STATEMENT_END),
]

var question_3_true_answer : Array = [
	Dialog.new("Totem",
	 "res://Assets/Sprites/chars/CloseUp/Player/player_normal.tres",
	"Good job. You have answered those questions correcly. now you may continue your journey traveller.",
	DialogType.STATEMENT),
]

var question_3_false_answer : Array = [
	Dialog.new("Totem",
	 "res://Assets/Sprites/chars/CloseUp/Player/player_normal.tres",
	"Wrong answer, it seems you are not worthy enough. comeback next time.",
	DialogType.STATEMENT),
]

var statements_init = [
	Dialog.new("Totem",
	 "res://Assets/Sprites/chars/CloseUp/Player/player_normal.tres",
	"Welcome to traveler. to pass this gate you have to answer these questions correctly",
	DialogType.STATEMENT),
	
	Dialog.new("Totem",
	 "res://Assets/Sprites/chars/CloseUp/Player/player_normal.tres",
	"Ibu mempunyai 2 1/2 karung tepung. Jika setiap karung berisi 2/5 kuintal tepung, maka berpa kuintal tepung ibu seluruhnya?",
	DialogType.QUESTION,
	DialogQuestion.new(
		"1 kuintal",
		[
		DialogAnswer.new("1 kuintal", question_1_true_answer),
		DialogAnswer.new("3/2 kuintal", question_1_false_answer),
		DialogAnswer.new("1/2 kuintal", question_1_false_answer),
		DialogAnswer.new("5/2 kuintal", question_1_false_answer)
	])),
	
	Dialog.new("Totem",
	 "res://Assets/Sprites/chars/CloseUp/Player/player_normal.tres",
	"Ibu mempunyai persediaan gula dalam 5 bungkus plastik. Jika setiap bungkus berisi 2 1/2 kg gula, berapa berat seluruh gula persediaan Ibu?",
	DialogType.QUESTION,
	DialogQuestion.new(
		"12 1/2 kg",
		[
		DialogAnswer.new("12 1/2 kg", question_2_true_answer),
		DialogAnswer.new("12 kg", question_2_false_answer),
		DialogAnswer.new("10 1/2 kg", question_2_false_answer),
		DialogAnswer.new("8 kg", question_2_false_answer)
	])),
	
	Dialog.new("Totem",
	 "res://Assets/Sprites/chars/CloseUp/Player/player_normal.tres",
	"Beni mandi menghabiskan air sebanyak 16 gayung. Setiap gayung berisi 3/5 liter. Berapa liter air yang dipakai Beni saat mandi?",
	DialogType.QUESTION,
	DialogQuestion.new(
		"9 3/5 liter",
		[
		DialogAnswer.new("9 3/5 liter", question_3_true_answer),
		DialogAnswer.new("8 2/5 Liter", question_3_false_answer),
		DialogAnswer.new("7 Liter", question_3_false_answer),
		DialogAnswer.new("10 1/5 Liter", question_3_false_answer)
	])),
]


func get_dialogues() -> Array:
	return statements_init
