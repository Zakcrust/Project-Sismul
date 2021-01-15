extends CanvasLayer

func set_text(text : String) -> void:
	$DamageText.text = text

func set_position(pos : Vector2) -> void:
	$DamageText.rect_global_position = pos
