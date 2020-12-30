extends Node

var fsm: PlayerStateMachine

var velocity : Vector2
var speed : float = 200

func next(next_state):
	get_tree()
	fsm.change_to(next_state)

func exit():
	fsm.back()
	

func enter() -> void:
	print("Current state : %s" % self.name)
	fsm.sprite.play("idle")


func process(_delta):
	velocity = Vector2()
	if Input.is_action_pressed("move_up"):
		velocity += Vector2.UP
	if Input.is_action_pressed("move_down"):
		velocity += Vector2.DOWN
	if Input.is_action_pressed("move_left"):
		velocity += Vector2.LEFT
	if Input.is_action_pressed("move_right"):
		velocity += Vector2.RIGHT
	velocity = velocity.normalized()
	fsm.character.move_and_slide(velocity * speed)
	if velocity == Vector2():
		fsm.sprite.play("idle")
	else:
		fsm.sprite.play("move")

	fsm.character.position.x = clamp(fsm.character.position.x, 0, fsm.character.boundary.x)
	fsm.character.position.y = clamp(fsm.character.position.y, 0, fsm.character.boundary.y)
	
	_interact()


func _interact() -> void:
	if Input.is_action_just_pressed("interact"):
		if(fsm.character.object_to_interact != null):
			if(fsm.character.object_to_interact.has_method("interact")):
				fsm.character.object_to_interact.interact(fsm.character)
			elif(fsm.character.object_to_interact.has_method("travel")):
				fsm.character.object_to_interact.travel()
			elif(fsm.character.object_to_interact.has_method("fight")):
				fsm.character.object_to_interact.fight(fsm.character.player_battler)
				SceneLoader.player_last_position = fsm.character.global_position
				fsm.character.queue_free()
				return
			next("Interact")
		print("No object to interact!")

func physics_process(_delta):
	pass

func input(_event):
	pass
