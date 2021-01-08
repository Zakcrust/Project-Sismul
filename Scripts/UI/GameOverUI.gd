extends CanvasLayer

var carrot : PackedScene = load("res://Scenes/UI/Carrot.tscn")

func _ready():
	randomize()
	spawn_carrot()


func spawn_carrot() -> void:
	var pos : Vector2 = Vector2(-200, -50)
	for i in range(0, 30):
		pos.x += 150
		var new_carrot = carrot.instance()
		new_carrot.position = pos
		$GameOver/CarrotsSpawner.add_child(new_carrot)


func _on_Timer_timeout():
	spawn_carrot()
