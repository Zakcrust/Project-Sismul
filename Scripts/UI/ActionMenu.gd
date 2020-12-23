extends Control

signal attack()
signal defend()
signal heal()
signal flee()


func _ready():
	$HBoxContainer.pause_mode = Node.PAUSE_MODE_STOP
	hide()

func activate():
	show()
	$AnimationPlayer.play("slide_in")
	yield($AnimationPlayer, "animation_finished")
	$HBoxContainer.pause_mode = Node.PAUSE_MODE_INHERIT
	print("action ready")

func disactivate():
	modulate = Color.transparent
	$HBoxContainer.pause_mode = Node.PAUSE_MODE_STOP
	hide()


func _on_Attack_pressed():
	disactivate()
	emit_signal("attack")


func _on_Defend_pressed():
	disactivate()
	emit_signal("defend")


func _on_Heal_pressed():
	disactivate()
	emit_signal("heal")


func _on_Flee_pressed():
	disactivate()
	emit_signal("flee")


func _on_State_activate_action_menu():
	activate()


func _on_State_disactivate_action_menu():
	disactivate()
