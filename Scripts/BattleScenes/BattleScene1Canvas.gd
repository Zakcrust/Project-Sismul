extends CanvasLayer


func _on_TurnQueue_set_post_battle_ui(value):
	$PostBattle.text = value
	$PostBattle.show()
