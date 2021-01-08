extends Node

class_name StatsBuff

var health_buff : Buff setget set_health_buff, get_health_buff
var energy_buff : Buff setget set_energy_buff, get_energy_buff
var armour_buff : Buff setget set_armour_buff, get_armour_buff
var damage_buff : Buff setget set_damage_buff, get_damage_buff
var speed_buff  : Buff setget set_speed_buff, get_speed_buff

func set_health_buff(value) -> void:
	health_buff = value

func set_energy_buff(value) -> void:
	energy_buff = value
	
func set_armour_buff(value) -> void:
	armour_buff = value

func set_damage_buff(value) -> void:
	damage_buff = value

func set_speed_buff(value) -> void:
	speed_buff = value

func get_health_buff() -> Buff:
	return health_buff

func get_energy_buff() -> Buff:
	return energy_buff
	
func get_armour_buff() -> Buff:
	return armour_buff

func get_damage_buff() -> Buff:
	return damage_buff

func get_speed_buff() -> Buff:
	return speed_buff

func cycle_turn() -> void:
	if health_buff != null:
		health_buff.turn()
	if energy_buff != null:
		energy_buff.turn()
	if armour_buff != null:
		armour_buff.turn()
	if damage_buff != null:
		print("Cycle damage turn...")
		damage_buff.turn()
	if speed_buff != null:
		speed_buff.turn()
