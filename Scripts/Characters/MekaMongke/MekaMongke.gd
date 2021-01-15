extends Area2D

signal end_turn

var stats : Stats
var battle_stats : Stats  = Stats.new(0,0,0,0,0)
var battle_buff : StatsBuff = StatsBuff.new()
var damage_notifier = load("res://Scenes/UI/PropNotifier/DamageNotifier.tscn")
onready var target = $Target setget , get_target

func _init():
	stats = Stats.new(10,10,6,0,2) 
	load_stats()

func multiply_stats(multiplier : float) -> void:
	stats.health = stats.health * multiplier
	stats.damage = stats.damage * multiplier
	stats.armor  = stats.armor * multiplier
	stats.energy = stats.energy * multiplier
	stats.speed  = stats.speed * multiplier
	print("Modified speed : %s" % stats.speed)
	load_stats()

func _ready():
	$Sprite/CharacterUI.set_health_bar_max_value(battle_stats.health)

func show_pointer() -> void:
	$Pointer.show()

func hide_pointer() -> void:
	$Pointer.hide()
	
func load_stats() -> void:
	battle_stats.health = stats.health
	battle_stats.damage = stats.damage
	battle_stats.armor = stats.armor
	battle_stats.energy = stats.energy
	battle_stats.speed = stats.speed

func check_buff() -> void:
	var current_health = battle_stats.health
	load_stats()
	battle_stats.health = current_health
	$BuffUI.hide_all_buff()
	if battle_buff.damage_buff != null:
		battle_stats.damage = battle_stats.damage + battle_buff.damage_buff.amount
		$BuffUI.show_buff(battle_buff.damage_buff.buff_type)
	if battle_buff.speed_buff != null:
		battle_stats.speed = battle_stats.speed + battle_buff.speed_buff.amount
		$BuffUI.show_buff(battle_buff.speed_buff.buff_type)
	if battle_buff.armour_buff != null:
		battle_stats.armor = battle_stats.armor + battle_buff.armour_buff.amount
		$BuffUI.show_buff(battle_buff.armour_buff.buff_type)


func get_target() -> Position2D:
	return target

func get_stats() -> Stats:
	return battle_stats

func play_turn():
	$State.initialize()
	yield(get_tree().create_timer(1.0), "timeout")
	$AI.play_turn()

func end_turn() -> void:
	check_buff()
	battle_buff.cycle_turn()
	emit_signal("end_turn")


func hurt(damage : int) -> void:
	var damage_dealt : int = damage - battle_stats.armor if damage - battle_stats.armor > 0 else 0
	battle_stats.health -= (damage_dealt)
	notify_damage(damage_dealt)
	$Sprite/CharacterUI.set_health_bar(battle_stats.health)
	if check_dead():
		battle_stats.health = 0
		$Anim.stop()
		$Anim.play("dead")
		$Sprite/CharacterUI.hide()
		$BuffUI.hide()
		$State.change_to("Dead")
		$CollisionShape2D.call_deferred("set_disabled", true)
		return
	$Anim.play("hurt")
	yield($Anim, "animation_finished")
	$Anim.play("idle")

func check_dead() -> bool:
	return battle_stats.health <= 0

func get_current_state() -> String:
	return $State.state.name

func victory() -> void:
	$Anim.stop()
	$Anim.play("idle")

func notify_damage(amount : int) -> void:
	var notifier = damage_notifier.instance()
	notifier.set_text(str(amount))
	notifier.set_position(global_position)
	add_child(notifier)
