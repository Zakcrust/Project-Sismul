extends TextureRect

signal tween_done()

var current_position : Vector2

func _ready():
	current_position = rect_position
	connect("tween_done", self, "floating_point")
	floating_point()

func floating_point() -> void:
	$Tween.interpolate_property(self, "rect_position", current_position, current_position + (30 * Vector2.DOWN), 0.5)
	$Tween.start()
	yield($Tween, "tween_completed")
	$Tween.interpolate_property(self, "rect_position", current_position + (30 * Vector2.DOWN), current_position , 0.5)
	$Tween.start()
	yield($Tween, "tween_completed")
	emit_signal("tween_done")
	
	
