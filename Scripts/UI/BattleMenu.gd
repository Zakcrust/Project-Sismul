extends Control


signal attack()
signal defend()
signal heal()
signal flee()



func _on_Attack_pressed():
	emit_signal("attack")


func _on_Defend_pressed():
	emit_signal("defend")


func _on_Heal_pressed():
	emit_signal("heal")


func _on_Flee_pressed():
	emit_signal("flee")
