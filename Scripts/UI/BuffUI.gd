extends Control

func _ready():
	hide_all_buff()

func show_buff(type) -> void:
	match type:
		ItemEffectTypes.ATTACK_BOOST:
			$VBoxContainer/AttackBoost.show()
		ItemEffectTypes.DEFENSE_BOOST:
			$VBoxContainer/DefenseBoost.show()
		ItemEffectTypes.SPEED_BOOST:
			$VBoxContainer/SpeedBoost.show()
		
func hide_buff(type) -> void:
	match type:
		ItemEffectTypes.ATTACK_BOOST:
			$VBoxContainer/AttackBoost.hide()
		ItemEffectTypes.DEFENSE_BOOST:
			$VBoxContainer/DefenseBoost.hide()
		ItemEffectTypes.SPEED_BOOST:
			$VBoxContainer/SpeedBoost.hide()

func hide_all_buff() -> void:
	for child in $VBoxContainer.get_children():
		child.hide()
