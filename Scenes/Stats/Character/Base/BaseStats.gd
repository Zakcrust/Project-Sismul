extends Node

class_name Stats

var health : int = 0 setget set_health, get_health
var energy : int = 0 setget set_energy, get_energy

var damage : int = 0 setget set_damage, get_damage
var armor : int = 0 setget set_armor, get_armor


func set_health(value : int) -> void:
	health = value

func set_energy(value : int) -> void:
	energy = value

func set_damage(value : int) -> void:
	damage = value

func set_armor(value : int) -> void:
	armor = value


func get_health() -> int:
	return health

func get_energy() -> int:
	return energy

func get_damage() -> int:
	return damage

func get_armor() -> int:
	return armor

func _init(init_health = 10, init_energy = 10, init_damage = 1, init_armor = 0):
	health = init_health
	energy = init_energy
	damage = init_damage
	armor = init_armor

