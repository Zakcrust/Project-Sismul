extends Node

var fsm: StateMachine

var inventory_scene : PackedScene = load("res://Scenes/UI/InventoryUI.tscn")

func next(next_state):
	get_tree()
	fsm.change_to(next_state)

func exit():
	fsm.back()


func enter() -> void:
	print("Current state : %s" % self.name)
	$Potion.position = fsm.character.global_position + Vector2(20, -6)
	$HealParticles.position = fsm.character.global_position + Vector2(14, 78)
	open_inventory()

func open_inventory() -> void:
	var inventory = inventory_scene.instance()
	inventory.add_consumables(PlayerData.inventory.items)
	inventory
	inventory.connect("done", self, "use_item")
	inventory.connect("cancel", self, "cancel")
	fsm.character.add_child(inventory)

func cancel() -> void:
	next("Ready")

func use_item() -> void:
	fsm.sprite.play("cast_skill_in")
	yield(fsm.sprite,"animation_finished")
	$HealAnim.play("use_potion")
	yield($HealAnim,"animation_finished")
	yield(get_tree().create_timer(0.5), "timeout")
	fsm.sprite.play("cast_skill_out")
	yield(fsm.sprite, "animation_finished")
	ItemManager.use_item(fsm.character, BattleData.item_to_use)
	fsm.character.update_health_bar_ui()
	$HealParticles.emitting = true
	yield(get_tree().create_timer(1.5), "timeout")
	$HealParticles.emitting = false
	next("EndTurn")
	


func process(_delta):
	pass

func physics_process(_delta):
	pass

func input(_event):
	pass
