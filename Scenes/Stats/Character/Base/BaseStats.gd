extends Resource

class_name Stats

var health : int = 0 setget set_health, get_health
var energy : int = 0 setget set_energy, get_energy

var damage : int = 0 setget set_damage, get_damage
var armor : int = 0 setget set_armor, get_armor

var speed : int = 0 setget set_speed, get_speed

func set_health(value : int) -> void:
	health = value

func set_energy(value : int) -> void:
	energy = value

func set_damage(value : int) -> void:
	damage = value

func set_armor(value : int) -> void:
	armor = value

func set_speed(value : int) -> void:
	speed = value


func get_health() -> int:
	return health

func get_energy() -> int:
	return energy

func get_damage() -> int:
	return damage

func get_armor() -> int:
	return armor

func get_speed() -> int:
	return speed

func _init(init_health : int, init_energy : int, init_damage : int, init_armor : int, init_speed : int):
	health = init_health
	energy = init_energy
	damage = init_damage
	armor = init_armor
	speed = init_speed

