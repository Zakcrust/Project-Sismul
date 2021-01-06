extends Control

func _ready():
	get_tree().paused = true
	$VBoxContainer/Music/VBoxContainer/MusicScroller.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))
	$VBoxContainer/Sound/VBoxContainer/SoundScroller.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Sound"))


func adjust_volume_music(value) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)

func adjust_volume_sfx(value) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound"), value)

func mute_music(value : bool) -> void:
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), value)

func mute_sfx(value : bool) -> void:
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Sound"), value)


func _on_SoundScroller_value_changed(value):
	if value == -12:
		mute_sfx(true)
	else:
		mute_sfx(false)
		adjust_volume_sfx(value)


func _on_MusicScroller_value_changed(value):
	if value == -12:
		mute_music(true)
		adjust_volume_music(value)
		return
	else:
		mute_music(false)
		adjust_volume_music(value)


func _on_Close_pressed():
	get_tree().paused = false
	queue_free()
