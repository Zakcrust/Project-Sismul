extends Control

func set_health_bar_max_value(max_value):
	$VBoxContainer/CenterContainer/HealthBar.max_value = max_value
	$VBoxContainer/CenterContainer/HealthBar.value = max_value

func set_health_bar(current_value):
	var value = $VBoxContainer/CenterContainer/HealthBar.value
	$Tween.interpolate_property($VBoxContainer/CenterContainer/HealthBar, "value",value,current_value,0.3,Tween.TRANS_LINEAR,Tween.EASE_IN)
	$Tween.start()
#	$VBoxContainer/CenterContainer/HealthBar.value = current_value

