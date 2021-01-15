extends Label

func float_text() -> void:
	$Tween.interpolate_property(self, "rect_position", rect_global_position, rect_global_position + (100 * Vector2.UP), 0.7)
	$Tween.start()
