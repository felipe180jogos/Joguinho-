extends Node2D

@export var payout_interval_seconds: float = 20.0
@export var payout_amount: int = 10
@export var payout_sound: AudioStream

@onready var _audio_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

var _timer: Timer

func _ready() -> void:
	_timer = Timer.new()
	_timer.one_shot = false
	_timer.wait_time = payout_interval_seconds
	_timer.timeout.connect(_on_payout_timeout)
	add_child(_timer)
	_timer.start()

func _on_payout_timeout() -> void:
	if payout_sound:
		_audio_player.stream = payout_sound
		_audio_player.play()
	GameManager.add_coins(payout_amount)
