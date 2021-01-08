extends Sprite

var direction = (Vector2.LEFT + Vector2.DOWN).normalized()


func _process(delta):
	position += 600 * direction * delta
	if position.y > 1240:
		queue_free()
