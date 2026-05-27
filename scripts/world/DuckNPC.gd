extends Area2D

@export var player: Node2D
@export var max_hearing_distance: float = 420.0
@export var short_click_sound: AudioStream
@export var long_click_sound: AudioStream

const LONG_CLICK_THRESHOLD_SECONDS := 0.5

var _press_start_ms: int = -1

@onready var _audio_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _process(_delta: float) -> void:
	_update_spatial_volume()

func _input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			_press_start_ms = Time.get_ticks_msec()
		else:
			if _press_start_ms < 0:
				return
			var held_time := float(Time.get_ticks_msec() - _press_start_ms) / 1000.0
			_press_start_ms = -1
			_play_click_sound(held_time)

func _play_click_sound(held_time: float) -> void:
	if held_time < LONG_CLICK_THRESHOLD_SECONDS:
		if not short_click_sound:
			return
		_audio_player.stream = short_click_sound
	else:
		if not long_click_sound:
			return
		_audio_player.stream = long_click_sound
	_update_spatial_volume()
	_audio_player.play()

func _update_spatial_volume() -> void:
	if player == null:
		_audio_player.volume_db = -80.0
		return
	var dist := global_position.distance_to(player.global_position)
	var ratio := clamp(1.0 - (dist / max(max_hearing_distance, 1.0)), 0.0, 1.0)
	_audio_player.volume_db = linear_to_db(max(ratio, 0.001))
