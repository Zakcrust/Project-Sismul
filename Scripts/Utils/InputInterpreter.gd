extends Node

export (NodePath) var state_machine_path

onready var state_machine = get_node(state_machine_path)


func _on_ActionMenu_attack():
	state_machine.change_to("Attack")


func _on_ActionMenu_defend():
	state_machine.change_to("Defend")


func _on_ActionMenu_flee():
	state_machine.change_to("Flee")


func _on_ActionMenu_heal():
	state_machine.change_to("Heal")
