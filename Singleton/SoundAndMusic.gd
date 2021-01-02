extends Node2D

const PEKORA_BGM = "res://Sounds/soundtrack/pekora_bgm.ogg"

const CORRECT_SFX = "res://Sounds/sfx/correct.wav"
const WRONG_SFX = "res://Sounds/sfx/wrong.wav"

func _ready():
	play_music(PEKORA_BGM)


func play_music(path : String) -> void:
	$Music.stream = load(path)
	$Music.play()

func play_sfx(path : String) -> void:
	$Sfx.stream = load(path)
	$Sfx.play()
