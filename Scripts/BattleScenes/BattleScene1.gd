extends Node2D

var player_spawn_points : Array
var enemy_spawn_points : Array

func _ready():
	SoundAndMusic.play_music(SoundAndMusic.BATTLE_MUSIC)
	for point in $PlayerSpawnPoint.get_children():
		player_spawn_points.append(point)
	
	for point in $EnemySpawnPoints.get_children():
		enemy_spawn_points.append(point)

func add_battlers(battlers : Array):
	battlers.sort_custom(self, "sort_battlers")
	var spawn_point : Position2D
	
	for battler in battlers:
		if battler.is_in_group("Player"):
			spawn_point = player_spawn_points.pop_front()
			battler.global_position = spawn_point.global_position
		elif battler.is_in_group("Enemy"):
			spawn_point = enemy_spawn_points.pop_front()
			battler.global_position = spawn_point.global_position
		$TurnQueue.add_child(battler)
	$TurnQueue.initialize()

static func sort_battlers(a, b) -> bool:
	return a.stats.speed > b.stats.speed
