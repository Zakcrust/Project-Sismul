extends Area2D

class_name Player

signal end_turn()
signal dead(object)

var enemies : Array
var stats : Stats
var battle_stats : Stats = Stats.new(0,0,0,0,0)
var battle_buff : StatsBuff = StatsBuff.new()

var minimax_node : MinimaxNode = MinimaxNode.new(0,0,true)
var damage_notifier = load("res://Scenes/UI/PropNotifier/DamageNotifier.tscn")
onready var target : Position2D = $Target setget , get_target

func _init():
	stats = PlayerData.stats
	load_stats()

func get_target() -> Position2D:
	return target

func load_stats() -> void:
	battle_stats.health = stats.health
	battle_stats.armor = stats.armor
	battle_stats.damage = stats.damage
	battle_stats.speed = stats.speed
	battle_stats.energy =  stats.energy

func _ready():
	stats = PlayerData.stats
	load_stats()
	$AttackCast.collide_with_areas = true
	$AttackCast.collide_with_bodies = false
	$Sprite.play("idle")
	update_health_bar_ui()

func show_pointer() -> void:
	$Pointer.show()

func hide_pointer() -> void:
	$Pointer.hide()

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
		print("Armor buff : %s" % battle_buff.armour_buff.amount)
		battle_stats.armor = battle_stats.armor + battle_buff.armour_buff.amount
		print("Armor has been increased to : %s" % battle_stats.armor)
		$BuffUI.show_buff(battle_buff.armour_buff.buff_type)

func update_health_bar_ui() -> void:
	$CharacterUI.set_health_bar_max_value(battle_stats.health)

func get_stats() -> Stats:
	return battle_stats

func victory() -> void:
	$Sprite.play("cast_skill_in")
	yield($Sprite, "animation_finished")
	yield(get_tree().create_timer(1.0), "timeout")
	$Sprite.play("cast_skill_out")
	yield($Sprite, "animation_finished")
	$Sprite.play("idle")

func play_turn():
	stats_report()
	$State.initialize()

func end_turn() -> void:
	check_buff()
	battle_buff.cycle_turn()
	stats_report()
	emit_signal("end_turn")

func stats_report() -> void:
	print("==============")
	print("PLAYER STATS")
	print("Health : %s" % battle_stats.health)
	print("Armor : %s" % battle_stats.armor)
	print("Damage : %s" % battle_stats.damage)
	print("Speed : %s" % battle_stats.speed)
	print("Energy : %s" % battle_stats.energy)
	print("==============")

func hurt(damage : int) -> void:
	get_parent().player_ref = self
	var damage_dealt : int = damage - battle_stats.armor if damage - battle_stats.armor > 0 else 0
	notify_damage(damage_dealt)
	print("damage dealt : %s" % damage_dealt)
	battle_stats.health -= (damage_dealt)
	$CharacterUI.set_health_bar(battle_stats.health)
	$Sprite.play("hurt")
	yield($Sprite, "animation_finished")
	$Sprite.play("idle")
	check_health()
	stats_report()
	

func get_current_state() -> String:
	return $State.state.name

func check_health() -> void:
	if battle_stats.health <= 0:
		battle_stats.health = 0
		$CharacterUI.hide()
		$BuffUI.hide()
		$State.change_to("Dead")


func revive(_reward) -> void:
	SoundAndMusic.play_music(SoundAndMusic.BATTLE_MUSIC)
	$State/Heal/HealParticles.position = global_position + Vector2(14, 78)
	$State/Heal/HealParticles.emitting = true
	$CharacterUI.show()
	$BuffUI.show()
	yield(get_tree().create_timer(1.0), "timeout")
	battle_stats.health = stats.health
	update_health_bar_ui()
	$CharacterUI.set_health_bar(battle_stats.health)
	yield(get_tree().create_timer(0.5), "timeout")
	$State.change_to("Ready")

func notify_damage(amount : int) -> void:
	var notifier = damage_notifier.instance()
	notifier.set_text(str(amount))
	notifier.set_position(global_position)
	add_child(notifier)
