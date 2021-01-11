extends CanvasLayer

func _ready():
	get_tree().paused = true
	$Help/Objective.hide()
	$Help/Controls.hide()

func _on_Close_pressed():
	get_tree().paused = false
	queue_free()


func _on_Objective_pressed():
	$Help/Objective.hide()
	$Objectives.show()
	$Help/Controls.hide()
	$Help/Controls2.show()


func _on_Controls2_pressed():
	$Help/Controls2.hide()
	$Help/Controls.show()
	$Objectives.hide()
	$Help/Objective.show()
	
