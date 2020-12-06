extends Area2D

signal anim_finished()

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			print("test")
			move_and_attack(event.position)


func _on_Sprite_animation_finished():
	emit_signal("anim_finished")


func move_and_attack(pos) -> void:
	$Tween.stop(self)
	face_direction(pos)
	$Sprite.play("move")
	$Tween.interpolate_property(self, "position",position, pos, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")
	$Sprite.play("attack")
	yield(self,"anim_finished")
	$Sprite.play("idle")
	
func face_direction(pos) -> void:
	if pos.x < position.x :
		$Sprite.scale.x = -1
	else:
		$Sprite.scale.x = 1
