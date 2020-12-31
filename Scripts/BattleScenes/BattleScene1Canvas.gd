extends CanvasLayer


func _on_TurnQueue_set_post_battle_ui(value):
	if value == "":
		$PostBattle.hide()
		return
	$PostBattle.text = value
	$PostBattle.show()
