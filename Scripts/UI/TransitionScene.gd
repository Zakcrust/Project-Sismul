extends CanvasLayer

func _ready():
	fade_out()
	yield($AnimationPlayer, "animation_finished")

func fade_in() -> void:
	$AnimationPlayer.play("fade_in")

func fade_out() -> void:
	$AnimationPlayer.play("fade_out")

func flicker() -> void:
	$AnimationPlayer.play("flicker")
