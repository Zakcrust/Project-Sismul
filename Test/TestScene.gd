extends Node2D

func _ready():
	for child in get_children():
		child.owner = self

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			add_sprite_instance(event.position)


func add_sprite_instance(pos : Vector2) -> void:
	var sprite : Sprite = Sprite.new()
	sprite.texture = load("res://icon.png")
	add_child(sprite)
	sprite.owner = self
	sprite.position = pos

func save_scene_to_resource() -> void:
	var packed_scene : PackedScene = PackedScene.new()
	packed_scene.pack(self)
	ResourceSaver.save("res://Test/saved_scene.tscn", packed_scene)
	


func _on_Button_pressed():
	save_scene_to_resource()
	get_tree().change_scene("res://Test/TransitionScene.tscn")
