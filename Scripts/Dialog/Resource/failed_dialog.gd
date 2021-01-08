extends Node

var statements_init = [
	Dialog.new("Golem",
	 "res://Assets/Sprites/chars/CloseUp/Golem/monster3.png",
	"You are not worthy enough. comeback later (Defeat remaining enemies in the area)",
	DialogType.STATEMENT_END),
]


func get_dialogues() -> Array:
	return statements_init
