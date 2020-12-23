extends Node

class_name MultipleChoice

var choices : Array setget , get_choices

func _init(choices_init : Array):
	choices = choices_init
	
func get_choices() -> Array:
	return choices
