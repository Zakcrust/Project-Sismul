extends Node

var question_1_true_answer : Array = [
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster2.png",
	"Correct, lets move on to the next question",
	DialogType.STATEMENT),
]

var question_1_false_answer : Array = [
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster2.png",
	"Wrong answer, it seems you are not worthy enough. comeback next time.",
	DialogType.STATEMENT_END),
]

var question_2_true_answer : Array = [
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster2.png",
	"Correct, lets move on to the next question",
	DialogType.STATEMENT),
]

var question_2_false_answer : Array = [
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster2.png",
	"Wrong answer, it seems you are not worthy enough. comeback next time.",
	DialogType.STATEMENT_END),
]

var question_3_true_answer : Array = [
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster2.png",
	"Good job. You have answered those questions correcly. now you may continue your journey traveller.",
	DialogType.STATEMENT),
]

var question_3_false_answer : Array = [
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster2.png",
	"Wrong answer, it seems you are not worthy enough. comeback next time.",
	DialogType.STATEMENT),
]

var statements_init = [
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster2.png",
	"Welcome to traveler. to pass this gate you have to answer these questions correctly",
	DialogType.STATEMENT),
	
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster2.png",
	"Siti akan membeli buku tulis sebanyak 1 1/2 lusin. Jika harga buku per lusin Rp36.000,00, maka berapa rupiah Siti hendak membayar?",
	DialogType.QUESTION,
	DialogQuestion.new(
		"Rp54.000,00",
		[
		DialogAnswer.new("Rp54.000,00", question_1_true_answer),
		DialogAnswer.new("Rp45.000,00", question_1_false_answer),
		DialogAnswer.new("Rp60.000,00", question_1_false_answer),
		DialogAnswer.new("Rp48.000,00", question_1_false_answer)
	])),
	
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster2.png",
	"Dayu berlari sejauh 5 1/4 km. Edo berlari sejauh 2 1/2 kali jarak yang ditempuh oleh Dayu. Berapa km jarak yang ditempuh Edo?",
	DialogType.QUESTION,
	DialogQuestion.new(
		"13 1/8 km",
		[
		DialogAnswer.new("13 1/8 km", question_2_true_answer),
		DialogAnswer.new("12 4/8 km", question_2_false_answer),
		DialogAnswer.new("11 1/8 km", question_2_false_answer),
		DialogAnswer.new("10 km", question_2_false_answer)
	])),
	
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster2.png",
	"Ali bersama dengan orang tuanya bepergian dari Kota Palu ke Luwuk melalui jalan darat dengan menempuh jarak 590 km. Setelah menempuh 3/5 perjalanan, mereka pun beristirahat. Berapa km perjalanan yang telah dilalui Ali bersama dengan orang tuanya?",
	DialogType.QUESTION,
	DialogQuestion.new(
		"354 km",
		[
		DialogAnswer.new("354 km", question_3_true_answer),
		DialogAnswer.new("348 km", question_3_false_answer),
		DialogAnswer.new("360 km", question_3_false_answer),
		DialogAnswer.new("327 km", question_3_false_answer)
	])),
]


func get_dialogues() -> Array:
	return statements_init
