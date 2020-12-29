extends Node

class_name Dialog


var dialog_character_name : String setget , get_character_name
var dialog_sprite_path : String setget , get_dialog_sprite_path
var dialog_text : String setget , get_dialog_text
var dialog_type : String setget , get_dialog_type
var dialog_question : DialogQuestion setget , get_dialog_question

func _init(character_name : String ,sprite_path : String, text : String, type : String, question = null):
	dialog_character_name = character_name
	dialog_sprite_path = sprite_path
	dialog_text = text
	dialog_type = type
	dialog_question = question

func get_character_name() -> String:
	return dialog_character_name

func get_dialog_sprite_path() -> String:
	return dialog_sprite_path

func get_dialog_text() -> String:
	return dialog_text

func get_dialog_type() -> String:
	return dialog_type

func get_dialog_question() -> DialogQuestion:
	return dialog_question
