extends StaticBody2D

var character : Character

export (String, "STAGE_1", "STAGE_2", "STAGE_3") var chest_key
export (GDScript) var reward
export (int) var reward_amount = 1

var pop_up_ui_scene = load("res://Scenes/UI/PopUpUI.tscn")
var opened_chest : Texture = load("res://Assets/UI/Icon/opened_golden_chest.tres")


var key : Item
var item_reward : ItemReward

func _ready():
	get_key()
	item_reward = reward.new()
	item_reward.reward.amount = reward_amount

func get_key() -> void:
	var list_item = ListItem.new()
	match(chest_key):
		"STAGE_1":
			key = list_item.stage_1_key
		"STAGE_2":
			key = list_item.stage_2_key
		"STAGE_3":
			key = list_item.stage_3_key


func open_chest() -> void:
	for item in PlayerData.inventory.items:
		if item.item_name == key.item_name:
			character.activate()
			character.redeem_reward(item_reward)
			return
	var pop_up = pop_up_ui_scene.instance()
	pop_up.set_text("Key is required to open this chest")
	add_child(pop_up)
	

func closed() -> void:
	character.activate()


func _on_DetectPlayer_body_entered(body):
	if body is Character:
		character = body
		character.object_to_interact = self
		$Exclamation.show()


func _on_DetectPlayer_body_exited(body):
	if body is Character:
		character.object_to_interact = null
		character = null
		$Exclamation.hide()


func _on_WinningChest_tree_exiting():
	game_over()

func game_over() -> void:
	get_tree().change_scene("res://Scenes/UI/GameOverUI.tscn")
